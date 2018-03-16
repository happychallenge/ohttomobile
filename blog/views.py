import json
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.views.decorators.http import require_POST
from django.http import JsonResponse, HttpResponse
from PIL import Image
from dateutil import parser
from clarifai.rest import ClarifaiApp

from .models import Post, Tag, Content, Theme, Bucket, Invitee
from .forms import PostForm
from account.models import Profile
from .getGPS import get_lat_lon_dt
from .adjust_location import transform

# app = ClarifaiApp(api_key='b207516379df44bfbcd5ba1c32514b41')
# model = app.models.get('general-v1.3')
forbidden = ['backlit', 'light', 'no person', 'silhouette', 'sky']

# Create your views here.
@login_required
def index(request, tag=None):
    friend_set = request.user.profile.get_following

    if tag:
        post_list = Post.objects.filter(is_public=True, 
                    author__profile__in=friend_set, tag_set__tag__iexact=tag) \
            .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set') \
            .select_related('author', 'author__profile', 'theme')[:30]
        context = {'post_list': post_list, 'tag': tag}
    else:
        print("Print this?")
        post_list = Post.objects.filter(is_public=True, author__profile__in=friend_set) \
            .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set') \
            .select_related('theme', 'author__profile')[:30]
        context = {'post_list': post_list,}
    return render(request, 'blog/timeline.html', context)


@login_required
def post_on_map(request, tag=None):
    friend_set = request.user.profile.get_following

    if tag:
        post_list = Post.objects.filter(is_public=True, 
                    author__profile__in=friend_set, tag_set__tag__iexact=tag) \
            .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
            .select_related('author__profile', 'theme')[:30]
        context = {'post_list': post_list, 'tag': tag,}
    else:
        post_list = Post.objects.filter(is_public=True, author__profile__in=friend_set) \
            .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
            .select_related('author__profile')[:30]
        context = {'post_list': post_list}
    return render(request, 'blog/on_map.html', context)


def post_detail(request):
    id = request.GET.get('id')
    post = get_object_or_404(Post, id=id)
    return render(request, 'blog/partial/post_detail.html', {'post': post})


@login_required
def history(request):
    post_list = Post.objects.filter(author=request.user)
    return render(request, 'blog/on_map.html', {'post_list':post_list, 'history': True, 'Mine': True})


def friend_profile(request, username):
    friend = get_user_model().objects.get(username=username)

    post_list = Post.objects.filter(author=friend, is_public=True) \
            .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
            .select_related('author__profile', 'theme')[:30]
    return render(request, 'blog/timeline.html', {'post_list':post_list, 'friend':friend, 'profile': True})


def user_theme_list(request, id):
    theme = get_object_or_404(Theme, id=id)
    if request.user == theme.author:
        post_list = Post.objects.filter(theme=theme)
        context = {'post_list':post_list, 'theme': theme, 'ownerTheme': True, }
    else:
        if theme.public == True:
            post_list = Post.objects.filter(theme=theme)
            context = {'post_list':post_list, 'theme': theme, 'otherTheme':True}
        else:
            if request.user in theme.get_invitee_all():
                post_list = Post.objects.filter(theme=theme)
                context = {'post_list':post_list, 'theme': theme, 'otherTheme':True}
            else:
                context = {'message': "You don't have a privilage to access these content"}
    return render(request, 'blog/timetable.html', context)

def user_theme_onmap(request, id):
    theme = get_object_or_404(Theme, id=id)
    if request.user == theme.author:
        post_list = Post.objects.filter(theme=theme)
        context = {'post_list':post_list, 'theme': theme, 'ownerTheme': True, }
    else:
        if theme.public == True:
            post_list = Post.objects.filter(theme=theme)
            context = {'post_list':post_list, 'theme': theme, 'otherTheme':True}
        else:
            if request.user in theme.get_invitee_all():
                post_list = Post.objects.filter(theme=theme)
                context = {'post_list':post_list, 'theme': theme, 'otherTheme':True}
            else:
                context = {'message': "You don't have a privilage to access these content"}
    return render(request, 'blog/on_map.html', context)

# def user_theme(request):
#     if request.user == theme.author:
#         post_list = Post.objects.filter(theme=theme)
#         context = {'post_list':post_list, 'theme': theme.name, 'ownerTheme': True, }
#     return render(request, 'blog/on_map.html', context)


@login_required
def position_timeline(request,tag=None):
    lat = float(request.GET.get('lat'))
    lng = float(request.GET.get('lng'))
    print("TimeTable Lat : ", lat, " Lng : ", lng)
    if tag:
        post_list = Post.objects.filter(is_public=True, 
            lat__range=(lat - 0.3, lat + 0.3), lng__range=(lng - 0.3, lng + 0.3),
            tag_set__tag__iexact=tag) \
                .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
                .select_related('author__profile')[:50]
        context = {'post_list': post_list, 'tag': tag, 'pos': True}
    else:
        post_list = Post.objects.filter(is_public=True, 
            lat__range=(lat - 0.3, lat + 0.3), lng__range=(lng - 0.3, lng + 0.3)) \
                .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
                .select_related('author__profile')[:50]
        context = {'post_list': post_list, 'pos': True}

    return render(request, 'blog/timeline.html', context)


@login_required
def position_on_map(request,tag=None):
    lat = float(request.GET.get('lat'))
    lng = float(request.GET.get('lng'))
    print("Map Lat : ", lat, " Lng : ", lng)
    if tag:
        post_list = Post.objects.filter(is_public=True, 
            lat__range=(lat - 0.3, lat + 0.3), lng__range=(lng - 0.3, lng + 0.3),
            tag_set__tag__iexact=tag) \
                .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
                .select_related('author__profile')[:50]
        context = {'post_list': post_list, 'tag': tag, 'pos': True}
    else:
        post_list = Post.objects.filter(is_public=True, 
            lat__range=(lat - 0.3, lat + 0.3), lng__range=(lng - 0.3, lng + 0.3)) \
                .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
                .select_related('author__profile')[:50]
        context = {'post_list': post_list, 'pos': True}
    return render(request, 'blog/on_map.html', context)


@login_required
def popup_map(request):
    # post = Post.objects.get(id=request.GET.get('post_id'))
    post = get_object_or_404(Post, id=request.GET.get('id'))
    return JsonResponse({ 'lat': post.lat, 'lng': post.lng })


@login_required
def bucket_list(request):
    post_list = request.user.profile.get_bucket_list
    context = {'post_list':post_list, 'bucket': True}
    return render(request, 'blog/timeline.html', context)


@login_required
def bucket_on_map(request):
    post_list = request.user.profile.get_bucket_list
    print(post_list)
    context = {'post_list':post_list, 'bucket': True}
    return render(request, 'blog/on_map.html', context)


@login_required
@require_POST
def post_like(request):
    pk = request.POST.get('pk', None)
    post = get_object_or_404(Post, pk=pk)
    post_like, created = post.like_set.get_or_create(user=request.user)

    if not created:
        post_like.delete()
        message = "Cancel like"
    else:
        message = "Like"
        request.user.profile.notify_post_liked(post)
    context = {
        'like_count': post.like_count, 'message': message,
    }
    return HttpResponse(json.dumps(context), content_type="application/json")

@login_required
@require_POST
def post_bucket(request):
    pk = request.POST.get('pk', None)
    post = get_object_or_404(Post, pk=pk)
    post_like, created = post.bucket_set.get_or_create(user=request.user)

    if not created:
        post_like.delete()
        message = "Cancel the bucket List"
    else:
        message = "Add the post into bucket List"
        request.user.profile.notify_post_bucketed(post)

    context = {
        'bucket_count': post.bucket_count, 'message': message,
    }
    return HttpResponse(json.dumps(context), content_type="application/json")

import sys
from django.utils.six import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile

@login_required
def post_add(request):
    mgLat, mgLng = (0.0, 0.0)
    if request.method == 'POST':
        form = PostForm(request.user, request.POST, request.FILES)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.save()

            pictures = request.FILES.getlist('pictures')
            tag_total = set()
        # Multi Files
            for filename in pictures:
                content = Content()
            # Read Position from Picture
                image = Image.open(filename)
                lat, lng, dt = get_lat_lon_dt(image)
                if lat != 0.0:
                    mgLat, mgLng = transform(lat, lng)

                if mgLat:
                    content.lat = mgLat
                    content.lng = mgLng
                if dt:
                    dt = parser.parse(dt)
                    content.taken_dt = dt

                try:
                    exif = dict(image._getexif().items())

                    if exif:
                        if exif[274] == 3:
                            image = image.rotate(180, expand=True)
                            image.save(filename)
                        elif exif[274] == 6:
                            image = image.rotate(270, expand=True)
                            image.save(filename)
                        elif exif[274] == 8:
                            image = image.rotate(90, expand=True)
                            image.save(filename)
                except:
                    print("There is no EXIF INFO")
                

                width, height = image.size
                if width > height :
                    x = 960
                    y = int((x * height) / width)
                else:
                    y = 960
                    x = int((y * width) / height)

                # save the resized file to our IO ouput with the correct format and EXIF data ;-)
                output = BytesIO()
                image = image.resize((x,y))
                image.save(output, format='JPEG', quality=90)
                output.seek(0)

                content.file = InMemoryUploadedFile(output,  
                        'ImageField', "%s.jpg" % filename.name.split('.')[0], 
                        'image/jpeg', sys.getsizeof(output), None)

                # image.thumbnail((x, y), Image.ANTIALIAS)
                # image.save(filename, quality=85)

                content.save()

                post.contents.add(content)

            #     response = model.predict_by_filename('.' + content.file.url)
            #     concepts = response['outputs'][0]['data']['concepts']
            #     tag_array = []
            #     for concept in concepts:
            #         if concept['value'] > 0.95:
            #             if concept['name'] not in forbidden:
            #                 obj, created = Tag.objects.get_or_create(tag=concept['name'])
            #                 tag_array.append(obj)
            #     content.tag_set.set(tag_array)
            #     tag_total.update(tag_array)

            # tag_total = list(tag_total)
            # post.tag_set.set(tag_total)
            post.lat = mgLat
            post.lng = mgLng
            post.save()
            
            return redirect('blog:post_edit',post.id)

    else:
        form = PostForm(user=request.user)
        return render(request, 'blog/post_add.html', {'form': form})


############################
# Invite Person
############################
def search_persons(request):
    person_list = []
    search_query = request.GET.get('keyword')
    if search_query:
        person_list = Profile.objects.filter(nickname__contains = search_query)
    return render(request, 'blog/partial/search_persons.html', {
            'person_list': person_list,
        })


def invite_persons(request, theme_id):
    theme = get_object_or_404(Theme, id=theme_id)

    if request.method == 'POST':
        persons_id = request.POST.getlist('persons_id')

        if persons_id:
            for person_id in persons_id:
                person = get_object_or_404(Profile, id=person_id)
                to_user = person.user
                obj, created = Invitee.objects.get_or_create(user=to_user, theme=theme)

                if created:
                    request.user.profile.notify_theme_invited(theme, to_user)

    return redirect('user_profile')

# from os import listdir
# from os.path import isfile, join
# def file_upload():

#     user = get_user_model().objects.get(username='njyoon@naver.com')
#     theme = Theme.objects.get(id=6)

#     db_path = 'contents/2018/cc'
#     mypath = '/Users/happy/Django/ohtto/media/contents/2017/kimchi'
#     for file in listdir(mypath):
#         if isfile(join(mypath, file)):
#             fullpath = join(mypath,file)
#             db_save_path = join(db_path, file)

#             if fullpath != '/Users/happy/Django/ohtto/media/contents/2017/kimchi/.DS_Store':
                
#                 post = Post()
#                 post.author = user
#                 post.theme = theme

#                 post.save()

#                 content = Content()
#                 image = Image.open(fullpath)
#                 lat, lng, dt = get_lat_lon_dt(image)

#                 if lat:
#                     content.lat = lat
#                     content.lng = lng
#                 if dt:
#                     dt = parser.parse(dt)
#                     content.taken_dt = dt

#                 width, height = image.size
#                 x = width * 0.5
#                 y = height * 0.5
#                 image = image.thumbnail((x, y), Image.ANTIALIAS)
#                 image.save(fullpath, quality=90)

#                 content.file = db_save_path
#                 content.save()
#                 post.contents.add(content)

#                 response = model.predict_by_filename(fullpath)
#                 concepts = response['outputs'][0]['data']['concepts']
#                 tag_array = []
#                 for concept in concepts:
#                     if concept['value'] > 0.95:
#                         if concept['name'] not in forbidden:
#                             obj, created = Tag.objects.get_or_create(tag=concept['name'])
#                             tag_array.append(obj)
#                 content.tag_set.set(tag_array)

#                 post.tag_set.set(tag_array)
#                 post.lat = lat
#                 post.lng = lng
#                 post.save()


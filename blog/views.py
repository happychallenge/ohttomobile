from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from PIL import Image
from dateutil import parser
from clarifai.rest import ClarifaiApp

from .models import Post, Tag, Content, Theme, Bucket, Invitee
from .forms import PostForm
from .getGPS import get_lat_lon_dt
from .adjust_location import transform

app = ClarifaiApp(api_key='b207516379df44bfbcd5ba1c32514b41')
model = app.models.get('general-v1.3')
forbidden = ['backlit', 'light', 'no person', 'silhouette', 'sky']

# Create your views here.
@login_required
def index(request, tag=None):
    friend_set = request.user.profile.get_following

    if tag:
        post_list = Post.objects.filter(is_public=True, 
                    author__profile__in=friend_set, tag_set__tag__iexact=tag) \
            .select_related('theme', 'author__profile') \
            .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')[:30]
        context = {'post_list': post_list, 'tag': tag}
    else:
        post_list = Post.objects.filter(is_public=True, author__profile__in=friend_set) \
            .select_related('theme', 'author__profile') \
            .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')[:30]
        context = {'post_list': post_list,}
    return render(request, 'blog/timeline.html', context)


@login_required
def onmap(request, tag=None):
    friend_set = request.user.profile.get_following

    if tag:
        post_list = Post.objects.filter(is_public=True, 
                    author__profile__in=friend_set, tag_set__tag__iexact=tag) \
            .prefetch_related('tag_set')[:30]
        context = {'post_list': post_list, 'tag': tag,}
    else:
        post_list = Post.objects.filter(is_public=True, author__profile__in=friend_set) \
            .prefetch_related('tag_set')[:30]
        context = {'post_list': post_list}
    return render(request, 'blog/onmap.html', context)


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
def position_onmap(request,tag=None):
    lat = float(request.GET.get('lat'))
    lng = float(request.GET.get('lng'))
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
    return render(request, 'blog/onmap.html', context)


@login_required
def theme_timeline(request, id, tag=None):
    theme = get_object_or_404(Theme, id=id)
    if request.user == theme.author:
        post_list = select_theme(theme, tag)
    else:
        if theme.public == True:
            post_list = select_theme(theme, tag)
        else:
            if request.user in theme.get_invitee_all():
                post_list = select_theme(theme, tag)
            else:
                context = {'message': "You don't have a privilage to access these content"}
    
    context = {'post_list':post_list, 'theme': theme }
    return render(request, 'blog/timeline.html', context)


def select_theme(theme, tag):
    if tag:
        return Post.objects.filter(theme=theme, tag_set__tag__iexact=tag) \
                .select_related('theme', 'author__profile') \
                .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')
    else:
        return Post.objects.filter(theme=theme) \
                .select_related('theme', 'author__profile') \
                .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')

@login_required
def theme_onmap(request, id, tag=None):
    theme = get_object_or_404(Theme, id=id)
    if request.user == theme.author:
        post_list = select_theme(theme, tag)
    else:
        if theme.public == True:
            post_list = select_theme(theme, tag)
        else:
            if request.user in theme.get_invitee_all():
                post_list = select_theme(theme, tag)
            else:
                context = {'message': "You don't have a privilage to access these content"}
    context = {'post_list':post_list, 'theme': theme }
    return render(request, 'blog/onmap.html', context)


@login_required
def bucket_timeline(request, tag=None):
    post_list = select_bucket(request, tag)
    # post_list = request.user.profile.get_bucket_list
    context = {'post_list':post_list, 'bucket': True, 'tag':tag}
    return render(request, 'blog/timeline.html', context)

def select_bucket(request, tag):
    user = request.user
    if tag:
        bucket_list = user.buckets.all()
        post_ids = [ i.post.id for i in bucket_list ]
        return  Post.objects.filter(id__in = post_ids, tag_set__tag__iexact=tag) \
                .select_related('author', 'author__profile', 'theme') \
                .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')
    else:
        bucket_list = user.buckets.all()
        post_ids = [ i.post.id for i in bucket_list ]
        return  Post.objects.filter(id__in = post_ids) \
                .select_related('author', 'author__profile', 'theme') \
                .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')


@login_required
def bucket_onmap(request, tag=None):
    post_list = select_bucket(request, tag)
    # post_list = request.user.profile.get_bucket_list
    context = {'post_list':post_list, 'bucket': True, 'tag':tag}
    return render(request, 'blog/onmap.html', context)


def post_detail(request):
    id = request.GET.get('id')
    post = get_object_or_404(Post, id=id)
    return render(request, 'blog/partial/post_detail.html', {'post': post})


@login_required
def history_timeline(request, tag=None):
    post_list = select_history(request, tag)
    return render(request, 'blog/timeline.html', 
            {'post_list':post_list, 'history': True, 'Mine': True, 'tag':tag})


def select_history(request, tag):
    user = request.user
    if tag:
        return  Post.objects.filter(author=user, tag_set__tag__iexact=tag) \
                .select_related('author', 'author__profile', 'theme') \
                .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')
    else:
        return  Post.objects.filter(author=user) \
                .select_related('author', 'author__profile', 'theme') \
                .prefetch_related('tag_set', 'like_user_set', 'contents', 
                'comments', 'bucket_user_set')


@login_required
def history_onmap(request, tag=None):
    post_list = select_history(request, tag)
    return render(request, 'blog/onmap.html', 
            {'post_list':post_list, 'history': True, 'Mine': True, 'tag':tag})




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

                response = model.predict_by_filename('.' + content.file.url)
                concepts = response['outputs'][0]['data']['concepts']
                tag_array = []
                for concept in concepts:
                    if concept['value'] > 0.95:
                        if concept['name'] not in forbidden:
                            obj, created = Tag.objects.get_or_create(tag=concept['name'])
                            tag_array.append(obj)
                content.tag_set.set(tag_array)
                tag_total.update(tag_array)

            tag_total = list(tag_total)
            post.tag_set.set(tag_total)

            post.lat = mgLat
            post.lng = mgLng
            post.save()
            
            return redirect('blog:post_edit',post.id)

    else:
        form = PostForm(user=request.user)
        return render(request, 'blog/post_add.html', {'form': form})



@login_required
def post_edit(request, id):
    post = Post.objects.prefetch_related('tag_set', 'contents').get(id=id) 
                
    if request.method == 'POST':
        form = PostForm(request.user, request.POST, request.FILES, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.save()
            tags = request.POST.get('tags')
            tag_array = []
            if tags:
                tag_list = tags.split(',')
                for tag in tag_list:
                    tag = tag.strip()
                    tagged, created = Tag.objects.get_or_create(tag=tag)
                    tag_array.append(tagged)
            post.tag_set.set(tag_array)

            return redirect('home')
    else:
        form = PostForm(user=request.user, instance=post)
        context = {'form': form, 'post': post}
        return render(request, 'blog/post_add.html', context)


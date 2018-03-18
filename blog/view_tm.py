from django.http import JsonResponse
from django.contrib.auth import get_user_model
from django.shortcuts import redirect, get_object_or_404, render
from django.contrib.auth.decorators import login_required
from decorators import ajax_required
from django.template.loader import render_to_string
from django.views.decorators.http import require_POST

from account.models import Profile
from .models import Theme, Invitee, Post, Tag
from .forms import ThemeForm, PostForm

def theme_add(request):
    data = dict()
    if request.method == 'POST':
        form = ThemeForm(request.POST)
        if form.is_valid():
            theme = form.save(commit=False)
            public = request.POST.get('public')
            if public == 'on':
                theme.public = True
            else:
                theme.public = False
            theme.author = request.user
            theme.save()

            Invitee.objects.create(user=request.user, theme=theme)
            
            persons_id = request.POST.getlist('persons_id')

            if persons_id:
                for person_id in persons_id:
                    person = get_object_or_404(Profile, id=person_id)
                    to_user = person.user
                    obj, created = Invitee.objects.get_or_create(user=to_user, theme=theme)

                    if created:
                        request.user.profile.notify_theme_invited(theme, to_user)

            return redirect('user_profile')

        else:
            data['status'] = False;
            data['html_form'] = render_to_string('blog/theme_add.html', {'form':form}, request=request)

    else:
        form = ThemeForm()

    data['html_form'] = render_to_string('blog/theme_add.html', {'form':form}, request=request)
    return JsonResponse(data)




@login_required
def popup_map(request):
    # post = Post.objects.get(id=request.GET.get('post_id'))
    post = get_object_or_404(Post, id=request.GET.get('id'))
    return JsonResponse({ 'lat': post.lat, 'lng': post.lng })


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


def search_persons(request):
    person_list = []
    search_query = request.GET.get('keyword')
    if search_query:
        person_list = Profile.objects.filter(nickname__contains = search_query)
    return render(request, 'blog/partial/search_persons.html', {
            'person_list': person_list,
        })


############################
# Invite Person
############################
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



def friend_profile(request, username):
    friend = get_user_model().objects.get(username=username)

    post_list = Post.objects.filter(author=friend, is_public=True) \
            .prefetch_related('tag_set', 'like_user_set__profile', 'contents', 'comments', 'bucket_set') \
            .select_related('author__profile', 'theme')[:30]
    return render(request, 'blog/timeline.html', {'post_list':post_list, 'friend':friend, 'profile': True})

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


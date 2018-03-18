from dateutil import parser
from django.db import models
from django.conf import settings
from django.contrib.auth import get_user_model
from django.utils.translation import ugettext_lazy as _
from PIL import Image
from clarifai.rest import ClarifaiApp
from .getGPS import get_lat_lon_dt

# Create your models here.
class Tag(models.Model):
    tag = models.CharField(max_length=50)

    class Meta:
        ordering = ('tag',)

    def __str__(self):
        return self.tag

class Theme(models.Model):
    """docstring for Subject"""
    """ Subject """
    name = models.CharField(_("Theme Name"), max_length=30)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='themes')
    public = models.BooleanField(default=True)
    invite_user_set = models.ManyToManyField(settings.AUTH_USER_MODEL,
                                   blank=True,
                                   related_name='invite_user_set',
                                   through='Invitee')  
    create_dt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{}'s {}".format(self.author.profile.nickname,self.name)

    @property
    def post_count(self):
        return self.posts.count()

    def get_theme_post(self):
        return self.posts.all()

    def get_invitee_all(self):
        return self.invite_user_set.all()

class Invitee(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    theme = models.ForeignKey(Theme)
    create_dt = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (
            ('user', 'theme')
        )


class Content(models.Model):
    """docstring for Content"""
    """ Content """
    file = models.ImageField(upload_to='contents/%Y/%m/%d/')
    address = models.CharField(max_length=100, blank=True, null=True)
    lat = models.FloatField(default=0)
    lng = models.FloatField(default=0)
    taken_dt = models.DateTimeField(blank=True, null=True)
    tag_set = models.ManyToManyField(Tag)
    create_dt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{} {}".format(self.id, self.file.url)


class Post(models.Model):
    """docstring for Post"""
    """ 설명 """
    theme = models.ForeignKey(Theme, blank=True, null=True, related_name='posts')
    text = models.TextField(blank=True, null=True)
    address = models.CharField(max_length=100, blank=True, null=True)
    lat = models.FloatField(default=0, blank=True, null=True)
    lng = models.FloatField(default=0, blank=True, null=True)
    is_public = models.BooleanField(default=True)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='posts')
    create_dt = models.DateTimeField(auto_now_add=True)
    contents = models.ManyToManyField(Content)
    tag_set = models.ManyToManyField(Tag)
    like_user_set = models.ManyToManyField(settings.AUTH_USER_MODEL,
                                           blank=True,
                                           related_name='like_user_set',
                                           through='Like')  # post.like_set 으로 접근 가능
    bucket_user_set = models.ManyToManyField(settings.AUTH_USER_MODEL,
                                           blank=True,
                                           related_name='bucket_user_set',
                                           through='Bucket')  # post.bucket_set 으로 접근 가능

    class Meta:
        ordering = ('-id',)


    @property
    def like_count(self):
        return self.like_user_set.count()

    @property
    def bucket_count(self):
        return self.bucket_user_set.count()

    def get_contents(self):
        return self.contents.all()

    def get_tag_set(self):
        return self.tag_set.all()

    def get_content_color(self):
        tag_set = self.get_tag_set()
        food = Tag.objects.get(tag="food")
        travel = Tag.objects.get(tag="travel")
        if food in tag_set:
            return "#006633"
        elif travel in tag_set:
            return "#0000ff"
        else:
            return "#ac00e0"


class Like(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL)
    post = models.ForeignKey(Post)
    create_dt = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = (
            ('user', 'post')
        )

class Bucket(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='buckets')
    post = models.ForeignKey(Post)
    create_dt = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ('-id',)
        unique_together = (
            ('user', 'post')
        )



# from openpyxl import load_workbook
# import pandas as pd
# def read_person_data():

#     wb = load_workbook('person.xlsx')
#     ws = wb['Sheet']
#     df = pd.DataFrame(ws.values)

#     for index, row in df.iterrows():
#         if index == 0:
#             continue
#         print(row)
#         email = row[0]
#         passwd = row[1]
#         name = row[2]
#         birth = row[3]
#         num = row[4]
#         friends = row[5]

#         user, created = User.objects.get_or_create(username=email, first_name=name, email=email)
#         user.set_password(passwd)
#         # 사진 입력

#         person, created = Person.objects.get_or_create(user=user, birthdate=birth, num=num)

#         if friends:
#             friends = friends.strip()
#             friend_list = friends.split(',')
#             for friend in friend_list:
#                 obj = Person.objects.get(num=friend)
#                 print(obj.user.first_name)
#                 person.friends.add(obj)
#                 obj.friends.add(person)




# from openpyxl import load_workbook
# import pandas as pd
# from django.contrib.auth import get_user_model
# def read_post_data():

#     User = get_user_model()
#     wb = load_workbook('positions.xlsx')
#     ws = wb['Sheet']
#     df = pd.DataFrame(ws.values)

#     for index, row in df.iterrows():
#         if index == 0:
#             continue
#         print(row)
#         name = row[0]
#         address = row[1]
#         lat = row[2]
#         lng = row[3]
#         picture = row[4]
#         user = row[5]

#         user = User.objects.get(id=user)
#         post= Post.objects.create(name=name, address=address, lat=lat,
#                 lng=lng, picture=picture, create_user=user)
#         print(post)
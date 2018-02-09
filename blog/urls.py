from django.conf.urls import url
from . import views, view_tm

urlpatterns = [
    url(r'^index/$', views.index, name='index'),
    url(r'^index/(?P<tag>\w+)/$', views.index, name='index_tag'),

    url(r'^post_on_map/$', views.post_on_map, name='post_on_map'),
    url(r'^post_on_map/(?P<tag>\w+)/$', views.post_on_map, name='post_on_map_tag'),

    url(r'^position_on_map/$', views.position_on_map, name='position_on_map'),
    url(r'^position_on_map/(?P<tag>\w+)/$', views.position_on_map, name='position_on_map_tag'),

    url(r'^position_timeline/$', views.position_timeline, name='position_timeline'),
    url(r'^position_timeline/(?P<tag>\w+)/$', views.position_timeline, name='position_timeline_tag'),


    url(r'^search_tag/(?P<tag>\w+)/$', views.index, name='tag_list'),

    url(r'^search_persons/$', views.search_persons, name='search_persons'),
    url(r'^invite_persons/(?P<theme_id>\d+)/$', views.invite_persons, name='invite_persons'),

    url(r'^add/$', views.post_add, name='post_add'),
    url(r'^edit/(?P<id>\d+)/$', view_tm.post_edit, name='post_edit'),
    url(r'^like/$', views.post_like, name='post_like'),
    url(r'^bucket/$', views.post_bucket, name='post_bucket'),
    url(r'^bucket_list/$', views.my_bucket_list, name='my_bucket_list'),

    url(r'^(?P<id>\d+)/$', views.user_theme_list, name='user_theme_list'),

    url(r'^detail/$', views.post_detail, name='post_detail'),


    url(r'^myhistory/$', views.my_history, name='my_history'),
    url(r'^friend_profile/(?P<username>[\w@-_\.]+)/$', views.friend_profile, name='friend_profile'),

    url(r'^theme_add/$', view_tm.theme_add, name='theme_add'),
]

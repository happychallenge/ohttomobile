from django.conf.urls import url
from . import views, view_tm

urlpatterns = [
    url(r'^index/$', views.index, name='index'),
    url(r'^index/(?P<tag>\w+)/$', views.index, name='index_tag'),
    url(r'^onmap/$', views.onmap, name='onmap'),
    url(r'^onmap/(?P<tag>\w+)/$', views.onmap, name='onmap_tag'),

    url(r'^position_onmap/$', views.position_onmap, name='position_onmap'),
    url(r'^position_onmap/(?P<tag>\w+)/$', views.position_onmap, name='position_onmap_tag'),
    url(r'^position_timeline/$', views.position_timeline, name='position_timeline'),
    url(r'^position_timeline/(?P<tag>\w+)/$', views.position_timeline, name='position_timeline_tag'),

    url(r'^theme/(?P<id>\d+)/$', views.theme_timeline, name='theme_timeline'),
    url(r'^theme/(?P<id>\d+)/(?P<tag>\w+)/$', views.theme_timeline, name='theme_timeline_tag'),
    url(r'^theme_onmap/(?P<id>\d+)/$', views.theme_onmap, name='theme_onmap'),
    url(r'^theme_onmap/(?P<id>\d+)/(?P<tag>\w+)/$', views.theme_onmap, name='theme_onmap_tag'),

    url(r'^bucket_timeline/$', views.bucket_timeline, name='bucket_timeline'),
    url(r'^bucket_timeline/(?P<tag>\w+)/$', views.bucket_timeline, name='bucket_timeline_tag'),
    url(r'^bucket_onmap/$', views.bucket_onmap, name='bucket_onmap'),
    url(r'^bucket_onmap/(?P<tag>\w+)/$', views.bucket_onmap, name='bucket_onmap_tag'),

    url(r'^history/$', views.history_timeline, name='history_timeline'),
    url(r'^history/(?P<tag>\w+)/$', views.history_timeline, name='history_timeline_tag'),
    url(r'^history_onmap/$', views.history_onmap, name='history_onmap'),
    url(r'^history_onmap/(?P<tag>\w+)/$', views.history_onmap, name='history_onmap_tag'),

    # url(r'^theme/$', views.user_theme_list, name='user_theme'),
    url(r'^popup_map/$', views.popup_map, name='popup_map'),

    url(r'^search_tag/(?P<tag>\w+)/$', views.index, name='tag_list'),

    url(r'^search_persons/$', views.search_persons, name='search_persons'),
    url(r'^invite_persons/(?P<theme_id>\d+)/$', views.invite_persons, name='invite_persons'),

    url(r'^add/$', views.post_add, name='post_add'),
    url(r'^edit/(?P<id>\d+)/$', view_tm.post_edit, name='post_edit'),
    url(r'^like/$', views.post_like, name='post_like'),
    url(r'^bucket/$', views.post_bucket, name='post_bucket'),

    url(r'^detail/$', views.post_detail, name='post_detail'),


    url(r'^friend_profile/(?P<username>[\w@-_\.]+)/$', views.friend_profile, name='friend_profile'),

    url(r'^theme_add/$', view_tm.theme_add, name='theme_add'),
]

"""simpleMenu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import url, include
from django.contrib import admin
from django.shortcuts import redirect

from django.contrib.auth import views as login_views
from account import views as signup_views
from django.conf.urls import (
        handler400, handler403, handler404, handler500
)

urlpatterns = [
    url('^$', lambda r: redirect('/blog/index/'), name='home'),
    url(r'^xmlyoon/', admin.site.urls),
    url(r'^blog/', include('blog.urls', namespace='blog')),
    url(r'^comment/', include('comment.urls', namespace='comment')),
    url(r'^account/', include('account.urls')),
    url(r'^activity/', include('activity.urls', namespace='activity')),
    url(r'^friend/', include('friend.urls', namespace='friend')),

    url(r'^signup/$', signup_views.signup, name='signup'),
    url(r'^login', login_views.login, {'template_name': 'account/login.html'},
        name='login'),
    url(r'^logout', signup_views.logout, name='logout'),
]

handler404 = 'ohttomobile.https.handler404'
handler500 = 'ohttomobile.https.handler500'

if settings.DEBUG == True:
    import debug_toolbar
    urlpatterns = [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns
    from django.conf.urls.static import static
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

else:
    from django.views import static
    static_list = [
        (settings.STATIC_URL, settings.STATIC_ROOT),
        (settings.MEDIA_URL, settings.MEDIA_ROOT),
    ]
    for (prefix_url, root) in static_list:
        if '://' not in prefix_url: # 외부 서버에서 서빙하는 것이 아니라면
            prefix_url = prefix_url.lstrip('/')
            url_pattern = r'^' + prefix_url + r'(?P<path>.+)'
            pattern = url(url_pattern, static.serve, kwargs={'document_root': root})
            urlpatterns.append(pattern)
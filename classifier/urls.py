"""classifier URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
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
from django.conf.urls import patterns, include, url

from django.contrib import admin
from web import views

urlpatterns = [
    url( r'^admin/', include(admin.site.urls) ),

    url( r'^$', views.index ),
    url( r'^add_to_root$', views.add_to_root ),
    url( r'^add_subpart$', views.add_subpart ),
    url( r'^del_part_and_subpart$', views.del_part_and_subpart ),
    url( r'^edt_part$', views.edt_part ),
    url( r'^autocomplete_sect$', views.autocomplete_sect ),
    url( r'^edt_make_alias$', views.edt_make_alias ),
    url( r'^move_subpart', views.move_subpart ),
    url( r'^recheck', views.recheck ),
    #url( r'^admin/doc/', include('django.contrib.admindocs.urls') ),

    #url(r'^admin/', admin.site.urls),
    #url( r'^admin/doc/', django.contrib.admindocs.urls ),
]

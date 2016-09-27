# -*- coding: utf-8 -*-
# Включили поддержку UTF-8 в Python. Без этого даже комментарии на русском языке нельзя писать.
# И не забывает следующих простых правил:
# 1. Помещаем оператор u перед каждой строкой, которая содержит символы не из кодировки ascii.
# 2. При обработке входящих запросов проверяем корректность использования request.encoding = "UTF-8"
# 3. Используем ugettext как псевдоним для _
# 4. В методах с параметрами в виде байтовой строки (например, quote() или hashlib.sha224())
#    не забываем привести ее в формат unicode: theunicodestring.encode("utf-8")
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
from web import views, trans, report

urlpatterns = [
    url( r'^admin/', include(admin.site.urls) ),

    url( r'^$', views.index ),
    url( r'^add_to_root$', views.add_to_root ),
    url( r'^add_subpart$', views.add_subpart ),
    url( r'^del_part_and_subpart$', views.del_part_and_subpart ),
    url( r'^edt_part$', views.edt_part ),
    url( r'^autocomplete_sect$', views.autocomplete_sect ),
    url( r'^edt_make_alias$', views.edt_make_alias ),
    url( r'^move_subpart$', views.move_subpart ),
    url( r'^recheck$', views.recheck ),
    url( r'^alias-manager$', views.aliasmanager ),
    url( r'^alias-marker$', views.aliasmarker ),
    url( r'^glukalo_1$', views.glukalo1 ),
    url( r'^glukalo_2$', views.glukalo2 ),
    # Интерфейс работы с переводами
    url( r'^trans$', trans.trans ),
    url( r'^trans/make-(?P<LANG>\w{3})-table$', trans.make_LANG_table ),
    url( r'^trans/update-(?P<LANG>\w{3})-table$', trans.make_update_LANG_table ),
    url( r'^trans/2check-(?P<LANG>\w{3})-table$', trans.make_2check_LANG_table ),
    url( r'^trans/add-new-(?P<LANG>\w{3})-empty-items$', trans.add_new_LANG_empty_items ),
    url( r'^trans/get_old$', trans.get_old ),
    url( r'^trans/make-double-as-not-relevant$', trans.make_double_as_not_relevant ),
    url( r'^trans/service$', trans.service ),
    # когда нет доступа
    url( r'^not-denice', views.not_denice ),

    # эксперименты
    url( r'^compare_sets/(?P<List2Compare>[\s\S]+|.*)$', report.compare_offers ),


    #url( r'^admin/doc/', include('django.contrib.admindocs.urls') ),

    #url(r'^admin/', admin.site.urls),
    #url( r'^admin/doc/', django.contrib.admindocs.urls ),
]

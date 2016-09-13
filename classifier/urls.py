# -*- coding: utf-8 -*-
# Р’РєР»СЋС‡РёР»Рё РїРѕРґРґРµСЂР¶РєСѓ UTF-8 РІ Python. Р‘РµР· СЌС‚РѕРіРѕ РґР°Р¶Рµ РєРѕРјРјРµРЅС‚Р°СЂРёРё РЅР° СЂСѓСЃСЃРєРѕРј СЏР·С‹РєРµ РЅРµР»СЊР·СЏ РїРёСЃР°С‚СЊ.
# Р� РЅРµ Р·Р°Р±С‹РІР°РµС‚ СЃР»РµРґСѓСЋС‰РёС… РїСЂРѕСЃС‚С‹С… РїСЂР°РІРёР»:
# 1. РџРѕРјРµС‰Р°РµРј РѕРїРµСЂР°С‚РѕСЂ u РїРµСЂРµРґ РєР°Р¶РґРѕР№ СЃС‚СЂРѕРєРѕР№, РєРѕС‚РѕСЂР°СЏ СЃРѕРґРµСЂР¶РёС‚ СЃРёРјРІРѕР»С‹ РЅРµ РёР· РєРѕРґРёСЂРѕРІРєРё ascii.
# 2. РџСЂРё РѕР±СЂР°Р±РѕС‚РєРµ РІС…РѕРґСЏС‰РёС… Р·Р°РїСЂРѕСЃРѕРІ РїСЂРѕРІРµСЂСЏРµРј РєРѕСЂСЂРµРєС‚РЅРѕСЃС‚СЊ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ request.encoding = "UTF-8"
# 3. Р�СЃРїРѕР»СЊР·СѓРµРј ugettext РєР°Рє РїСЃРµРІРґРѕРЅРёРј РґР»СЏ _
# 4. Р’ РјРµС‚РѕРґР°С… СЃ РїР°СЂР°РјРµС‚СЂР°РјРё РІ РІРёРґРµ Р±Р°Р№С‚РѕРІРѕР№ СЃС‚СЂРѕРєРё (РЅР°РїСЂРёРјРµСЂ, quote() РёР»Рё hashlib.sha224())
#    РЅРµ Р·Р°Р±С‹РІР°РµРј РїСЂРёРІРµСЃС‚Рё РµРµ РІ С„РѕСЂРјР°С‚ unicode: theunicodestring.encode("utf-8")
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
from web import views, trans

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
    # СЂР°Р±РѕС‚Р° СЃ РёРЅС‚РµСЂС„РµР№СЃРѕРј РґР»СЏ СЂР°Р±РѕС‚С‹ СЃ Р°РіРµРЅС‚СЃС‚РІРѕРј РїРµСЂРµРІРѕРґРѕРІ
    url( r'^trans$', trans.trans ),
    url( r'^trans/make-(?P<LANG>\w{3})-table$', trans.make_LANG_table ),
    url( r'^trans/update-(?P<LANG>\w{3})-table$', trans.make_update_LANG_table ),
    url( r'^trans/2check-(?P<LANG>\w{3})-table$', trans.make_2check_LANG_table ),
    url( r'^trans/add-new-(?P<LANG>\w{3})-empty-items$', trans.add_new_LANG_empty_items ),
    url( r'^trans/get_old$', trans.get_old ),
    url( r'^trans/make-double-as-not-relevant$', trans.make_double_as_not_relevant ),
    url( r'^trans/service$', trans.service ),
    #url( r'^admin/doc/', include('django.contrib.admindocs.urls') ),

    #url(r'^admin/', admin.site.urls),
    #url( r'^admin/doc/', django.contrib.admindocs.urls ),
]

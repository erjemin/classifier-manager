# -*- coding: utf-8 -*-
# coding: utf8
# Включили поддержку UTF-8 в Python. Без этого даже комментарии на русском языке нельзя писать.
# И не забывает следующих простых правил:
# 1. Помещаем оператор u перед каждой строкой, которая содержит символы не из кодировки ascii.
# 2. При обработке входящих запросов проверяем корректность использования request.encoding ="UTF-8"
# 3. Используем ugettext как псевдоним для _
# 4. В методах с параметрами в виде байтовой строки (например, quote() или hashlib.sha224() )
#    не забываем привести ее в формат unicode: theunicodestring.encode("utf-8")

# Python скрипт для извлечения и хранения данных от reformazhkh о московских домов
__author__ ='Sergei Erjemin'

from django.contrib import admin
from django.contrib.admin import ModelAdmin, TabularInline
from classifier.models import TreeClassify, LangMatch, dataPulscen



class TreeClassifyAdmin (ModelAdmin):
    search_fields = ['sSectionName_ru', 'sSectionName_trans']
    ordering = ('sbSortTree', 'id', 'kParent_id', 'sSectionName_ru')
    # list_display = ('sSectionName_ru', 'sSectionName_trans', 'iNesting', 'kParent_id', 'kAlias_id', 'lParentChain' )
    list_display = ('sSectionName_ru', 'id', 'sSectionName_trans', 'iNesting', 'lParentChain', 'kParent_id',
                    'sbSortTree', 'kAlias_id',  )
    list_filter = ('iNesting',  )
admin.site.register(TreeClassify, TreeClassifyAdmin)


class LangMatchAdmin (ModelAdmin):
    search_fields = ['kTreeClassify', 'sSectionNameSlug', 'sSectionNameForeign', 'id',]
    ordering = ('bSectionTranslateActual', 'sLangType', )
    list_display = ('kTreeClassify', 'id', 'sLangType', 'sSectionNameForeign', 'sSectionNameSlug',
                    'bSectionTranslateActual', 'dSectionTranslateCreate', 'dSectionTranslateModify', )
    list_filter = ('bSectionTranslateActual', 'sLangType',  )
admin.site.register(LangMatch, LangMatchAdmin)

class dataPulscenAdmin (ModelAdmin):
    search_fields = ['pul_name', 'pul_category', 'pul_description', 'pul_properties', 'id', 'pul_ext_id', 'pul_price', ]
    ordering = ('id', 'pul_ext_id', )
    list_display = ('id', 'pul_ext_id', 'pul_name', 'pul_category', 'pul_price',
                    'pul_price_currency', 'pul_price_unit' )
    list_filter = ('pul_price_currency', 'pul_price_unit',  )
admin.site.register(dataPulscen, dataPulscenAdmin)

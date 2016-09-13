# -*- coding: utf-8 -*-
# coding: utf8
# Включили поддержку UTF-8 в Python. Без этого даже комментарии на русском языке нельзя писать.
# И не забывает следующих простых правил:
# 1. Помещаем оператор u перед каждой строкой, которая содержит символы не из кодировки ascii.
# 2. При обработке входящих запросов проверяем корректность использования request.encoding ="UTF-8"
# 3. Используем ugettext как псевдоним для _
# 4. В методах с параметрами в виде байтовой строки(например, quote() или hashlib.sha224())
#    не забываем привести ее в формат unicode: theunicodestring.encode("utf-8")

__author__ = 'Sergei Erjemin'
# ~~V<

from django.db import models
import django.db.models.fields
from datetime import date, datetime
from django.utils import timezone

LANGUAGE_TYPE = ((u"RUS", u"Русский (Russian)"),
                 (u"ENG", u"Английский (English)"),
                 (u"DEU", u"Немецкий (Deutsch)"),
                 (u"SPA", u"Испанский (Español)"),
                 (u"POR", u"Португальский (Português)"),
                 (u"ITA", u"Итальянский (Italiano)"),
                 (u"FRA", u"Французский (Français)"),
                 (u"POL", u"Польский (Polszczyzna)"),
                 (u"TUR", u"Турецкий (Türkçe)"),
                 (u"ZHO", u"Китайский (汉语)"),
                 (u"NAN", u"Китайский-миньский (臺灣話)"),
                 (u"ARA", u"Арабский (العربية)"),
                 (u"HIN", u"Хинди (हिन्दी)"),
                 (u"PRS", u"Фарси (فارْسِى)"),
                 (u"JPN", u"Японский (日本語)"))

#####################################################
#####################################################
# таблица ЯЗЫКОВЫЕ СООТВЕТСТВИЯ
class LangMatch(models.Model):
    kTreeClassify = models.ForeignKey(
        'TreeClassify',
        blank=True,
        default=None,
        null=True,
        db_index=True,
        verbose_name=u"Оригинал",
        help_text=u"Ссылка на оригинальную категорию в дереве категорий."
    )
    sLangType = models.CharField(
        choices = LANGUAGE_TYPE,
        max_length=3,
        blank=True,
        unique=False,
        db_index=True,
        default = u"ENG",
        help_text = u"Язык",
        verbose_name = u"Язык из набора языков сайта."
    )
    sSectionNameForeign = models.CharField(
        max_length=250,
        blank=True,
        unique=False,
        db_index=True,
        default = u"",
        verbose_name=u"Название",
        help_text=u"Название раздела на некотором языке набора."
    )
    sSectionNameSlug = models.SlugField(
        max_length=250,
        blank=True,
        unique=False,
        db_index=True,
        default = u"",
        verbose_name=u"Slug",
        help_text=u"Slug-транслитерация c этого языка (lat)."
    )
    bSectionTranslateActual = models.BooleanField(
        db_index=True,
        default = False,
        verbose_name=u"Актуально",
        help_text=u"Текущий перевода актуален (Да/Нет)."
    )
    bSectionMastTranslate = models.BooleanField(
        db_index=True,
        default = True,
        verbose_name=u"Нужен перевод",
        help_text=u"Этот раздел нужно отправить на перевод (Да/Нет)."
    )
    bSectionMastCheck = models.BooleanField(
        db_index=True,
        default = True,
        verbose_name=u"Нужно проверить",
        help_text=u"Перевода этот раздела нужно проверить (Да/Нет)."
    )
    dSectionTranslateCreate = models.DateTimeField(
        auto_now_add=True,
        verbose_name=u"Создано"
    )
    dSectionTranslateModify = models.DateTimeField(
        auto_now=True,
        db_index=True,
        verbose_name=u"Отредактировано"
    )

    def __unicode__(self):
        return u"%5d→%s: %s (%s)" % (self.id, self.kTreeClassify, self.sSectionNameForeign, self.sLangType )

    class Meta:
        verbose_name = u"Языковое соответсвие (перевода)"
        verbose_name_plural = u"Языковые соответсвия (переводы)"
        ordering = ['bSectionTranslateActual', 'sLangType', 'id', ]   # назанчить ordering при ForeignKey просто так нельзя. Только через _id





SECTION_TYPE  = ((1,   u"Товары"),
                 (5,   u"Какая-то техника"),
                 (50,  u"ОКВЭД"),
                 (67,  u"Отрасли и сферы деятельности"),
                 (75,  u"Дополнительные услуги"),
                 (100, u"Страны и регионы"))

class BinaryCharField(models.Field):
    def __init__(self, *args, **kwargs):
        super(BinaryCharField, self).__init__(*args, **kwargs)
    def db_type(self, connection):
        return 'varchar(64) binary'
#####################################################
#####################################################
# таблица ДЕРЕВО-КЛАССИКАТОР
class TreeClassify(models.Model):
    sSectionName_ru = models.CharField(
        max_length=250,
        blank=True,
        unique=False,
        db_index=True,
        verbose_name=u"Название",
        help_text=u"Название раздела (ru)"
    )
    sSectionName_trans = models.SlugField(
        max_length=250,
        blank=True,
        unique=False,
        db_index=True,
        verbose_name=u"Slug",
        help_text=u"Slug-транслитерация раздела (lat)"
    )
    kParent = models.ForeignKey(
        'TreeClassify',
        blank=True,
        default=None,
        null=True,
        verbose_name=u"Родитель",
        help_text=u"Родительский раздел для данного раздела"
    )
    iNesting = models.PositiveSmallIntegerField(
        blank=False,
        default=0,
        unique=False,
        db_index=True,
        verbose_name=u"Вложеность",
        help_text=u"Как глубоко вложен этот раздел относительно корня"
    )
    lParentChain = models.CommaSeparatedIntegerField(
        max_length=200, # на самом деле это поле varchar, но в поле длинной 200 можно хранить вложенность 32
        blank=True,
        default=0,
        db_index=True,
        verbose_name=u"Цепочка",
        help_text=u"Все (последователность) предков данной категории"
    )
    sSectionPropertiesJSON = models.TextField(
        max_length=4096,
        blank=True,
        default="{}",
        verbose_name=u"Свойства",
        help_text=u"Свойства объектов (товаров) раздела. В виде JSON (семантику еще нао придумать)"
    )
    kAlias = models.ForeignKey(
         # поле необходимо для исключения рекурсивных запросов
         'TreeClassify',
         blank=True,
         default=None,
         null=True,
         related_name='kAliasID',
         verbose_name=u"Это псевдоним",
         help_text=u"Указывает, что данный раздел является псевдонимом раздела с указанным ID"
    )
    iSectionType = models.SmallIntegerField(
        choices = SECTION_TYPE,
        default = 1,
        db_index = True,
        unique = False,
        help_text = u"Тип раздела",
        verbose_name = u"Даный раздел относится к данному типу"
    )
    # вообще-то это поле должно быть не посто VARCHAR(64) а VARCHAR(64) BINARY
    # работает и без этого, но если очень много разделов на одном уровне то бывают проблемы
    # делаем в базе команду
    # ALTER TABLE classifier_treeclassify MODIFY sbSortTree VARCHAR BINARY NOT NULL;
    # или через интерфейсы рефакторинга в dbFofge
    sbSortTree = models.CharField(
        db_index=True,
        max_length=64,
        unique = False,
        default="",
        help_text = u"Сортер",
        verbose_name = u"Символьно-бинарная строка для быстрой сортировки дерева"
    )
    dSectionCreate = models.DateTimeField(
        auto_now_add=True,
        verbose_name=u"Создано"
    )
    dSectionModify = models.DateTimeField(
        auto_now=True,
        db_index=True,
        verbose_name=u"Отредактировано"
    )

    def __unicode__(self):
        # return u"%5d: %s (→%5d)" % (self.id, self.sSectionName_ru, self.kParent_id )
        return u"%5d: %s" % (self.id, self.sSectionName_ru )

    class Meta:
        verbose_name = u"Катаолог товаров"
        verbose_name_plural = u"Каталог товаров"
        ordering = ['sbSortTree', 'id', 'kParent_id', 'sSectionName_ru']   # назанчить ordering при ForeignKey просто так нельзя. Только через _id


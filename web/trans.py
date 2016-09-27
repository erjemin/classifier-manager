# -*- coding: utf-8 -*-
# Включили поддержку UTF-8 в Python. Без этого даже комментарии на русском языке нельзя писать.
# И не забывает следующих простых правил:
# 1. Помещаем оператор u перед каждой строкой, которая содержит символы не из кодировки ascii.
# 2. При обработке входящих запросов проверяем корректность использования request.encoding = "UTF-8"
# 3. Используем ugettext как псевдоним для _
# 4. В методах с параметрами в виде байтовой строки (например, quote() или hashlib.sha224())
#    не забываем привести ее в формат unicode: theunicodestring.encode("utf-8")

from django import forms
from django.http import HttpResponse, Http404, response, request
from django.shortcuts import render, HttpResponseRedirect
# from django.core.context_processors import csrf
from classifier.models import TreeClassify, LangMatch
from django.db.models import Count
from django.core.files import File
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required
from django.db import connection

from time import clock
import httplib                                  # библиотека работы с HTTP (скачиваем ссылки и все такое)
import json
import re
import urllib
from datetime import datetime
from add_func import GetSlug
from classifier.models import SECTION_TYPE, LANGUAGE_TYPE
from classifier.settings import STATIC_BASE_PATH
from django.template import loader, Context
import os
import random
import time


FILENAME_FULL_CLASSIFIER_4TRBUB_CSV = "csv/cargotogo-full-classifier" # имя файла
FILENAME_UPDATE_CLASSIFIER_4TRBUB_CSV = "csv/cargotogo-update-classifier" # имя файла
FILENAME_2CHECK_CLASSIFIER_4TRBUB_CSV = "csv/cargotogo-2check-classifier" # имя файла
FILENAME_OLD_CLASSIFIER_CSV = "csv/site_store_category_1.csv" # имя файла
NOTR_STRING = u"-?-?-?-"


def trans (request) :
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "trans.html" # шаблон

    NumViz = 0 # как будто первый визит
    if 'NumVisit' in request.COOKIES:
         # стоят кукии, и это не первый визит
         NumViz = request.COOKIES['NumVisit'] # читаем из кук число визитов
         NumViz = int(NumViz) + 1             # увеличиваем порядковый номер визитов
    LangVariant = []
    # действия для русского языка, как базового
    iNumItemsInClassify = TreeClassify.objects.aggregate(Count('id'))['id__count']
    iNumRUItemsInLangMatch = TreeClassify.objects.aggregate(Count('sSectionName_ru'))['sSectionName_ru__count']
    for i in LANGUAGE_TYPE:
        try: # пробуем получить инфу о файле FILENAME_FULL_CLASSIFIER_4TRBUB
            FullFileName = STATIC_BASE_PATH + u'/' + FILENAME_FULL_CLASSIFIER_4TRBUB_CSV + u"-" + i[0] + u'.csv'
            FileFullSize = os.path.getsize(FullFileName)
            FileFullTimestamp = datetime.fromtimestamp(os.path.getmtime(FullFileName))
        except:
            FileFullSize = 0
            FileFullTimestamp = 0
        try: # пробуем получить инфу о файле FILENAME_UPDATE_CLASSIFIER_4TRBUB_CSV
            FullFileName = STATIC_BASE_PATH + u'/' + FILENAME_UPDATE_CLASSIFIER_4TRBUB_CSV + u"-" + i[0] + u'.csv'
            FileUpdateSize = os.path.getsize(FullFileName)
            FileUpdateTimestamp = datetime.fromtimestamp(os.path.getmtime(FullFileName))
        except:
            FileUpdateSize = 0
            FileUpdateTimestamp = 0
        try: # пробуем получить инфу о файле FILENAME_2CHECK_CLASSIFIER_4TRBUB_CSV
            FullFileName = STATIC_BASE_PATH + u'/' + FILENAME_2CHECK_CLASSIFIER_4TRBUB_CSV + u"-" + i[0] + u'.csv'
            File2CheckSize = os.path.getsize(FullFileName)
            File2Checktamp = datetime.fromtimestamp(os.path.getmtime(FullFileName))
        except:
            File2CheckSize = 0
            File2CheckTimestamp = 0
        q = LangMatch.objects.filter(sLangType=i[0])
        iNumTotal = q.aggregate(Count('kTreeClassify_id'))
        # определение число дублей
        sqlFindDouble = "SELECT" \
                "  COUNT(classifier_langmatch.kTreeClassify_id) AS iNUM," \
                "  classifier_langmatch.kTreeClassify_id AS id " \
                "FROM classifier_langmatch " \
                "WHERE classifier_langmatch.sLangType = '%s' " \
                "      AND" \
                "      classifier_langmatch.bSectionTranslateActual IS TRUE " \
                "GROUP BY classifier_langmatch.kTreeClassify_id " \
                "HAVING COUNT(classifier_langmatch.sSectionNameForeign) > 1;" % i[0]
        iNumDoubles = len(list(LangMatch.objects.raw(sqlFindDouble)))
        sqlNoAddedToTranslate = "SELECT" \
                 "  COUNT(TAB.kTreeClassify_id) AS id " \
                 "FROM (SELECT" \
                 "        classifier_langmatch.kTreeClassify_id" \
                 "      FROM classifier_langmatch" \
                 "      WHERE (classifier_langmatch.sLangType = 'RUS'" \
                 "             AND classifier_langmatch.bSectionTranslateActual = TRUE)" \
                 "             OR classifier_langmatch.sLangType = '%s'" \
                 "      GROUP BY classifier_langmatch.kTreeClassify_id" \
                 "      HAVING COUNT(classifier_langmatch.kTreeClassify_id) = 1) AS TAB;" % i[0]
        iNumNoAddedToTranslate = LangMatch.objects.raw(sqlNoAddedToTranslate)[0].id
        # q2 = LangMatch.objects.filter(sLangType=i[0]).annotate(Count('id'))
        iNumActualNum = q.filter(bSectionTranslateActual=True).aggregate(Count('kTreeClassify_id'))
        iNumUnActualNum = q.filter(bSectionTranslateActual=False).aggregate(Count('kTreeClassify_id'))
        iNumNewItems = u"что-то-пошло-не-так-ОШИБКА"
        if i[0] == u"RUS":
            # для русского языка число новых разделов надо посчитать особым образом,
            # сравнивая реальные совпадения названий, а не только через id
            sqlNewRusClassifier = "SELECT" \
                                  "  COUNT(classifier_treeclassify.id) AS id " \
                                  "FROM classifier_treeclassify" \
                                  "  LEFT OUTER JOIN classifier_langmatch" \
                                  "    ON classifier_langmatch.sSectionNameForeign = classifier_treeclassify.sSectionName_ru " \
                                  "WHERE classifier_langmatch.sLangType IS NULL OR classifier_langmatch.sLangType <> 'RUS';"
            iNumNewItems = TreeClassify.objects.raw(sqlNewRusClassifier)[0].id
        else:
            iNumNewItems = iNumItemsInClassify - iNumDoubles - iNumActualNum['kTreeClassify_id__count']
        LangVariant.append({
            'FILENAME_FULL_CLASSIFIER_4TRBUB': FILENAME_FULL_CLASSIFIER_4TRBUB_CSV + u"-" + i[0] + u'.csv',
            'FILENAME_UPDATE_CLASSIFIER_4TRBUB': FILENAME_UPDATE_CLASSIFIER_4TRBUB_CSV + u"-" + i[0] + u'.csv',
            'FILENAME_2CHECK_CLASSIFIER_4TRBUB': FILENAME_2CHECK_CLASSIFIER_4TRBUB_CSV + u"-" + i[0] + u'.csv',
            'FULL_FILE_SIZE': FileFullSize,
            'UPDATE_FILE_SIZE': FileUpdateSize,
            'CHECK_FILE_SIZE': File2CheckSize,
            'FULL_FILE_DATATIME': FileFullTimestamp,
            'UPDATE_FILE_DATATIME': FileUpdateTimestamp,
            'CHECK_FILE_DATATIME': File2CheckTimestamp,
            'ITEM_PAIR': iNumDoubles,
            'ITEM_NEW': iNumNewItems,
            'ITEM_NO_ADD_TO_TRANSLATE': iNumNoAddedToTranslate,
            'ITEM_TOTAL': iNumTotal['kTreeClassify_id__count'],
            'ITEM_ACTUAL_N': iNumActualNum['kTreeClassify_id__count'],
            'ITEM_UNACTUAL_N': iNumUnActualNum['kTreeClassify_id__count'],
            'LANGUAGE_NAME': i[1],
            'LANGUAGE_CODE': i[0]
        })
    dimention_to_template.update({ 'LANG_WORKER': LangVariant })
    # вывод дерева

    dimention_to_template.update({'NV': NumViz})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    response.set_cookie("NumVisit",  NumViz, max_age=604800) ## ставим или перезаписывем куки (неделя)
    return response


# создание полной CSV-таблицы для перевода
def make_LANG_table(request, LANG="ENG" ):
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон
    # NumOfWords = 0 # счетчик слов
    with open(STATIC_BASE_PATH + u'/' + FILENAME_FULL_CLASSIFIER_4TRBUB_CSV + u"-" + LANG +'.csv', 'w') as file_csv:
        myfile = File(file_csv)
        # myfile.write( u"id;\tA;\tB;\tC;\tD;\tE;\tF;\tG;\tH;\tI;\tJ;\tK;\tL;\tM;\tN;\n".encode('cp1251', 'ignore') )
        myfile.write( u"\n".encode('cp1251', 'ignore') )
        qBig = TreeClassify.objects.all().order_by('sbSortTree')
        for i in qBig:
            # NumOfWords += len(i.sSectionName_ru.split(" ")) # считаем слова в названии категории
            sql = "SELECT" \
                  "  classifier_treeclassify.sSectionName_ru," \
                  "  classifier_treeclassify.id " \
                  "FROM classifier_treeclassify " \
                  "WHERE classifier_treeclassify.id IN (%s) " \
                  "ORDER BY classifier_treeclassify.sbSortTree;" % i.lParentChain
            # qChain = TreeClassify.objects.filter(id__in=chain).order_by('sbSortTree')
            qChain = TreeClassify.objects.raw(sql)
            s2CSV = u"%07d;\n" % i.id
            for j in qChain:
                s2CSV += u"%s;\t" % j.sSectionName_ru
                try:
                    if LANG != u"RUS":
                        qGetLang = LangMatch.objects.filter(sLangType=LANG, kTreeClassify_id=j.id).order_by('-dSectionTranslateModify').first()
                        s2CSV += u"%s\n" % qGetLang.sSectionNameForeign
                    else:
                        s2CSV += u"\n"
                except:
                    s2CSV += NOTR_STRING + u"\n"
            # print s2CSV
            s2CSV += "\n"
            myfile.write( s2CSV.encode('cp1251', 'ignore') )
            # print NumOfWords
    myfile.closed
    file_csv.closed
    LangVariant = []
    # действия для русского языка, как базового
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# создание недавно добавленых и отредактированных элеменом в CSV-таблицу для перевода
def make_update_LANG_table (request, LANG="ENG" ):
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон
    with open(STATIC_BASE_PATH + u'/' + FILENAME_UPDATE_CLASSIFIER_4TRBUB_CSV + u"-" + LANG +'.csv', 'w') as file_csv:
        myfile = File(file_csv)
        # myfile.write( u"id;\tA;\tB;\tC;\tD;\tE;\tF;\tG;\tH;\tI;\tJ;\tK;\tL;\tM;\tN;\n".encode('cp1251', 'ignore') )
        myfile.write( u"\n".encode('cp1251', 'ignore') )
        sqlGetNew = "SELECT classifier_treeclassify.id," \
                    "       classifier_treeclassify.lParentChain " \
                    "FROM classifier_langmatch" \
                    "  INNER JOIN classifier_treeclassify" \
                    "    ON classifier_langmatch.kTreeClassify_id = classifier_treeclassify.id " \
                    "WHERE classifier_langmatch.bSectionMastTranslate IS TRUE" \
                    "      AND classifier_langmatch.sLangType = '%s'" \
                    "ORDER BY classifier_treeclassify.sbSortTree;" % LANG
        qBig = TreeClassify.objects.raw(sqlGetNew)
        for i in qBig:
            sql = "SELECT" \
                  "  classifier_treeclassify.sSectionName_ru," \
                  "  classifier_treeclassify.id " \
                  "FROM classifier_treeclassify " \
                  "WHERE classifier_treeclassify.id IN (%s) " \
                  "ORDER BY classifier_treeclassify.sbSortTree;" % i.lParentChain
            # qChain = TreeClassify.objects.filter(id__in=chain).order_by('sbSortTree')
            qChain = TreeClassify.objects.raw(sql)
            s2CSV = u"%07d;\n" % i.id
            for j in qChain:
                s2CSV += u"%s;\t" % j.sSectionName_ru
                try:
                    qGetLang = LangMatch.objects.filter(sLangType=LANG, kTreeClassify_id=j.id).order_by('-dSectionTranslateModify').first()
                    s2CSV += u"%s\n" % qGetLang.sSectionNameForeign
                except:
                    s2CSV += NOTR_STRING + u"\n"
            # print s2CSV
            s2CSV += "\n"
            myfile.write( s2CSV.encode('cp1251', 'ignore') )
            # print NumOfWords
    myfile.closed
    file_csv.closed
    # действия для русского языка, как базового
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# создание недпано добавленых и отредактированных элеменом в CSV-таблицу для перевода
def make_2check_LANG_table (request, LANG="ENG" ):
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон
    with open(STATIC_BASE_PATH + u'/' + FILENAME_2CHECK_CLASSIFIER_4TRBUB_CSV + u"-" + LANG +'.csv', 'w') as file_csv:
        myfile = File(file_csv)
        # myfile.write( u"id;\tA;\tB;\tC;\tD;\tE;\tF;\tG;\tH;\tI;\tJ;\tK;\tL;\tM;\tN;\n".encode('cp1251', 'ignore') )
        myfile.write( u"\n".encode('cp1251', 'ignore') )
        sqlGetNew = "SELECT classifier_treeclassify.id," \
                    "       classifier_treeclassify.lParentChain " \
                    "FROM classifier_langmatch" \
                    "  INNER JOIN classifier_treeclassify" \
                    "    ON classifier_langmatch.kTreeClassify_id = classifier_treeclassify.id " \
                    "WHERE classifier_langmatch.bSectionMastCheck IS TRUE" \
                    "      AND classifier_langmatch.bSectionMastTranslate IS NOT TRUE" \
                    "      AND classifier_langmatch.bSectionTranslateActual IS TRUE" \
                    "      AND classifier_langmatch.sLangType = '%s'" \
                    "ORDER BY classifier_treeclassify.sbSortTree;" % LANG
        qBig = TreeClassify.objects.raw(sqlGetNew)
        for i in qBig:
            sql = "SELECT" \
                  "  classifier_treeclassify.sSectionName_ru," \
                  "  classifier_treeclassify.id " \
                  "FROM classifier_treeclassify " \
                  "WHERE classifier_treeclassify.id IN (%s) " \
                  "ORDER BY classifier_treeclassify.sbSortTree;" % i.lParentChain
            # qChain = TreeClassify.objects.filter(id__in=chain).order_by('sbSortTree')
            qChain = TreeClassify.objects.raw(sql)
            s2CSV = u"%07d;\n" % i.id
            for j in qChain:
                s2CSV += u"%s;\t" % j.sSectionName_ru
                try:
                    qGetLang = LangMatch.objects.filter(sLangType=LANG, kTreeClassify_id=j.id).order_by('-dSectionTranslateModify').first()
                    s2CSV += u"%s\n" % qGetLang.sSectionNameForeign
                except:
                    s2CSV += NOTR_STRING + u"\n"
            # print s2CSV
            s2CSV += "\n"
            myfile.write( s2CSV.encode('cp1251', 'ignore') )
            # print NumOfWords
    myfile.closed
    file_csv.closed
    # действия для русского языка, как базового
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


#
def add_new_LANG_empty_items (request, LANG="ENG" ):
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон
    # NumOfWords = 0 # счетчик слов
    if LANG == u"RUS":
        # русский язык является базовым для всего каталога, по-этому для него отдельный код
        sqlGetNew = "SELECT" \
                    "  classifier_treeclassify.id," \
                    "  classifier_treeclassify.sSectionName_ru," \
                    "  classifier_treeclassify.sSectionName_trans " \
                    "FROM classifier_treeclassify" \
                    "  LEFT OUTER JOIN classifier_langmatch" \
                    "    ON classifier_langmatch.sSectionNameForeign = classifier_treeclassify.sSectionName_ru " \
                    "WHERE classifier_langmatch.sLangType IS NULL" \
                    "      OR" \
                    "      classifier_langmatch.sLangType <> 'RUS' " \
                    "ORDER BY classifier_treeclassify.sbSortTree;"
        qGetNewItem = TreeClassify.objects.raw(sqlGetNew)
        for i in qGetNewItem:
            # print i.id, i.sSectionName_ru, i.sSectionName_trans
            item = LangMatch (kTreeClassify_id = i.id,
                              sLangType = 'RUS',
                              sSectionNameForeign = i.sSectionName_ru,
                              bSectionTranslateActual = True,
                              sSectionNameSlug = i.sSectionName_trans)
            item.save()
    else:
        # это какой-то иностранный язык. С ним поступаем иначе.
        # получить id новых разделов (есть активные записи русской части таблицы, и нет записей в текущей языковой):
        # SELECT
        #   classifier_treeclassify.id,
        #   classifier_treeclassify.lParentChain,
        #   classifier_treeclassify.sbSortTree
        # FROM classifier_treeclassify
        # WHERE classifier_treeclassify.id IN (
        #    SELECT
        #      classifier_langmatch.kTreeClassify_id
        #    FROM classifier_langmatch
        #    WHERE (classifier_langmatch.sLangType = 'RUS'
        #           AND
        #           classifier_langmatch.bSectionTranslateActual = TRUE)
        #          OR classifier_langmatch.sLangType = 'ENG'
        #    GROUP BY classifier_langmatch.kTreeClassify_id
        #    HAVING COUNT(classifier_langmatch.kTreeClassify_id) = 1)
        # ORDER BY classifier_treeclassify.sbSortTree
        sqlGetNew = "SELECT" \
                    "  classifier_langmatch.kTreeClassify_id AS id " \
                    "FROM classifier_langmatch " \
                    "WHERE" \
                    "  (classifier_langmatch.sLangType = 'RUS' AND classifier_langmatch.bSectionTranslateActual = TRUE)" \
                    "  OR" \
                    "  classifier_langmatch.sLangType = '%s' " \
                    "GROUP BY classifier_langmatch.kTreeClassify_id " \
                    "HAVING COUNT(classifier_langmatch.kTreeClassify_id) = 1;" % LANG
        qGetNewItem = TreeClassify.objects.raw(sqlGetNew)
        for i in qGetNewItem:
            item = LangMatch (kTreeClassify_id = i.id,
                              sLangType = LANG,
                              sSectionNameForeign = NOTR_STRING,
                              bSectionTranslateActual = False,
                              sSectionNameSlug = "%s: %d" % (LANG, i.id))
            item.save()
        pass
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# это представление (вьюшка) только для "подкачки" старых переводов из "убитой" базы. Подкачка имеет смысл
# только при единовременномиспользовании, уже проделано и эту вьюку можно убить. Но для целостности путь останется.
def get_old(request):
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон
    with open(STATIC_BASE_PATH + '/' + FILENAME_OLD_CLASSIFIER_CSV, 'r') as file_csv:
        myfile = File(file_csv)
        DataFile = myfile.read()
        DataFile = DataFile.split("\n")  # разбиваем CSV-файл на строчки
        for Line in DataFile:
            LineData = Line.split("\t") # разбиваем строку по табам
            try:
                # проверим, что в Классифайдах есть русский раздел с названием из строки CSV
                qGetAnalog = TreeClassify.objects.filter(sSectionName_ru=LineData[5])
                if qGetAnalog:
                    # собственно отфигачивается CSV при условии. что
                    # RUS: LineData[5].decode('utf-8')  -- русский в колонке 5
                    # ENG: LineData[6] -- английский в колонке 6
                    # ZHO: LineData[7] -- китайский-традиционный в колонке 7
                    # NAN: LineData[8] -- китайский наньский (тайваньский) в колонке 8
                    # print u"RUS:", LineData[5].decode('utf-8'), u"\tENG:", LineData[6], u"\tZHO:", LineData[7], u"\tNAN:", LineData[8]
                    for i in qGetAnalog:
                        # print u"~ID:", i.id, u"\tNAME:", i.sSectionName_ru
                        qCheckToExist = LangMatch.objects.filter(kTreeClassify_id=i.id, sLangType='ENG' )
                        if not qCheckToExist:
                            # ТАКИХ ENG-запискй (английских) нет в LangMatch
                            # добавляем!
                            add = LangMatch(kTreeClassify_id = i.id,
                                            sLangType = 'ENG',
                                            sSectionNameForeign = LineData[6],
                                            bSectionTranslateActual = True,
                                            sSectionNameSlug = GetSlug(LineData[6]))
                            add.save()
                        qCheckToExist = LangMatch.objects.filter(kTreeClassify_id=i.id, sLangType='ZHO' )
                        if not qCheckToExist:
                            # Таких ZHO-переводов (Китайский традиционный) нет в LangMatch
                            # добавляем!
                            add = LangMatch(kTreeClassify_id = i.id,
                                            sLangType = 'ZHO',
                                            sSectionNameForeign = LineData[7].decode('utf-8'),
                                            bSectionTranslateActual = True,
                                            sSectionNameSlug = "")
                            add.save()
                        qCheckToExist = LangMatch.objects.filter(kTreeClassify_id=i.id, sLangType='NAN' )
                        if not qCheckToExist:
                            # Таких NAN-переводов (Китайский-наньский/тайваньский) нет в LangMatch
                            # добавляем!
                            add = LangMatch(kTreeClassify_id = i.id,
                                            sLangType = 'NAN',
                                            sSectionNameForeign = LineData[8].decode('utf-8'),
                                            bSectionTranslateActual = True,
                                            sSectionNameSlug = "")
                            add.save()
            except:
                # что-то пошло не так... Ну и фиг с ним
                print "AAA!!!"
                pass
    myfile.closed
    file_csv.closed
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


def make_double_as_not_relevant(request):
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон

    if request.method == 'GET':
        if 'lang' not in request.GET:
            response = render (request, template, dimention_to_template)
            return response
    else:
        response = render (request, template, dimention_to_template)
        return response
    sql = "SELECT" \
              "  COUNT(classifier_langmatch.kTreeClassify_id) AS iNUM," \
              "  classifier_langmatch.kTreeClassify_id AS id " \
              "FROM classifier_langmatch " \
              "WHERE classifier_langmatch.sLangType = '%s'" \
              "      AND" \
              "      classifier_langmatch.bSectionTranslateActual IS TRUE " \
              "GROUP BY classifier_langmatch.kTreeClassify_id " \
              "HAVING COUNT(classifier_langmatch.sSectionNameForeign) > 1;" % request.GET['lang']
    qDouble = LangMatch.objects.raw(sql)
    for i in qDouble:
        qPair = LangMatch.objects.filter(bSectionTranslateActual=True,
                                         sLangType=request.GET['lang'],
                                         kTreeClassify_id=i.id).order_by('-dSectionTranslateModify')
        # print i.id, i.iNUM
        for j in qPair[1:]:
            j.bSectionTranslateActual = False
            j.save()
    # действия для русского языка, как базового
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response

# сервисная функция. Пометить РУсскаий как не нужный к переводу
def service (request):
    tStart = clock()
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "informer0.html" # шаблон
    # ОБНОВЛЕНИЕ ПАРОЛЯ СУПЕРПОЛЬЗОВАТЕЛЯ
    from django.contrib.auth.models import User
    # user = User.objects.get( username='nikolya_857')
    user = User.objects.get( username='eserg')
    # user.set_password("Nikolai857")
    user.set_password("qwaseR12")
    user.save()
    # n =  LangMatch.objects.filter(sLangType=u"ENG", sSectionNameForeign=NOTR_STRING).update(bSectionMastTranslate=True, bSectionMastCheck=False)
    # print n
    # n =  LangMatch.objects.filter(bSectionTranslateActual=False).update(bSectionMastTranslate=False, bSectionMastCheck=False)
    # print n
    # n =  LangMatch.objects.filter(sSectionNameForeign=NOTR_STRING).update(bSectionMastTranslate=True, bSectionMastCheck=False)
    # print n

    # действия для русского языка, как базового
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response
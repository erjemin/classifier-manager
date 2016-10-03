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
from django.contrib.auth.decorators import login_required
from django.db import connection
from django.utils import timezone
from time import clock
import httplib                                  # библиотека работы с HTTP (скачиваем ссылки и все такое)
import json
import re
import urllib
import datetime
from add_func import GetSlug
from classifier.models import SECTION_TYPE
from django.template import loader, Context

import random
import time

def index (request) :
    tStart = clock()
    # проверка на аутентификацию
    if not request.user.is_authenticated():
        return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "index.html" # шаблон

    MarkRowWithID = []
    if request.method == 'GET':
        if 'to_do' in request.GET:
            # MarkRowWithID = int(request.GET['to_do'])
            MarkRowWithID = request.GET['to_do'].split(',')
            for countSection in range(0, len(MarkRowWithID)):
                try:
                    MarkRowWithID[countSection] = int(MarkRowWithID[countSection])
                except:
                    pass
            # MarkRowWithID.append(int(request.GET['to_do']))
        if 'to_del' in request.GET:
            dimention_to_template.update({'MAKE_DEL': request.GET['to_del']})
        if 'to_aka' in request.GET:
            try:
                dimention_to_template.update({'MAKE_AKA': [int(request.GET['to_aka'])]})
            except:
                pass
    dimention_to_template.update({'MAKE_LIGHT': MarkRowWithID})

    NumViz = 0 # как будто первый визит
    if 'NumVisit' in request.COOKIES:
         # стоят кукии, и это не первый визит
         NumViz = request.COOKIES['NumVisit'] # читаем из кук число визитов
         NumViz = int(NumViz) + 1             # увеличиваем порядковый номер визитов
    # варианты деревьев
    TreeVariant = []
    for i in SECTION_TYPE:
        TreeVariant.append({
            'TREE_NAME': i[1],
            'TREE_VAL': i[0]
        })
    dimention_to_template.update({ 'TREE_VARIANT': TreeVariant })
    # вывод дерева

    queryTree = TreeClassify.objects.order_by('iSectionType', 'sbSortTree') #.filter(iNesting=0)
    dimention_to_template.update({'NUM_T': queryTree.count()})
    TreeData = []
    maxNest = 0
    levNest = []
    TypeOfTree = -100
    for countSection in queryTree:
        if TypeOfTree != countSection.iSectionType:
            TypeOfTree = countSection.iSectionType
            TreeData.append({
                'id': 'NEW_SEC',
                'sSectionName_ru': countSection.get_iSectionType_display()
                 })
        lag = u""
        path = u""
        if maxNest < countSection.iNesting:
            maxNest = countSection.iNesting
            levNest.append(maxNest)
        Chain = countSection.lParentChain.split(',')
        for count in Chain[0:-1]:
        #    queryTMP = TreeClassify.objects.get(id=count)
        #    path += queryTMP.sSectionName_ru + ' / '
            lag += u" ├──"
        # path += countSection.sSectionName_ru
        strII = lag+countSection.sSectionName_ru
        strII = strII.replace(u"├── ", u"│   ")
        TreeData.append({
            'id': countSection.id,
            'path': countSection.sbSortTree,
            'nest': countSection.iNesting,
            'alias': countSection.kAlias_id,
            'sSectionName_ru': strII,
            'sSectionName_trans': countSection.sSectionName_trans
        })
    # TreeData.sort(key=lambda countSection: countSection['path'])
    for count in range(0, len(TreeData)):
        try:
            if TreeData[count+1]['nest'] < TreeData[count]['nest']:
                TreeData[count]['sSectionName_ru'] = TreeData[count]['sSectionName_ru'].replace(u"├──", u"└──")
        except:
            pass
    dimention_to_template.update({'QUERY': TreeData})
    dimention_to_template.update({'LEV_NEST': levNest})

    dimention_to_template.update({'NV': NumViz})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    response.set_cookie("NumVisit",  NumViz, max_age=604800) ## ставим или перезаписывем куки (неделя)
    return response


# Сортировка и исправление даннх в веточке дерева (для рекурсивной сортировки деревьев)
def hlop_hlop ( parentID, parentNESTING, parentCHAIN, sorter, sectionType ):
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    query = TreeClassify.objects.filter(kParent_id=parentID).order_by('sSectionName_ru')
    iteration = 0
    for count in query:
        count.iNesting = parentNESTING+1
        count.lParentChain = "%s,%d" % (parentCHAIN, count.id)
        count.sbSortTree = sorter+unichr(iteration+65)
        count.sSectionName_trans = GetSlug(count.sSectionName_ru)
        count.iSectionType = sectionType
        count.save()
        hlop_hlop(  count.id, count.iNesting, count.lParentChain, count.sbSortTree, count.iSectionType )
        # print u"id:",count.id, \
        #     u"|\tname:", count.sSectionName_ru, \
        #     u"|\tвложеность:", count.iNesting, \
        #     u"|\tцепочка:", count.lParentChain, \
        #     u"|\tюнисортер:", count.sbSortTree, \
        #     u"|\tтип_дерева:", count.iSectionType
        iteration += 1
    return


# Перезадать «Сортер», «Цепи» и «Слэги» и т.п.
def recheck (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    # dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        queryTree = TreeClassify.objects.filter(kParent_id=None).order_by('iSectionType', 'sSectionName_ru')
        iteration = 0
        for count in queryTree:
            count.iNesting = 0
            count.lParentChain = "%d" % count.id
            count.sbSortTree = unichr(iteration+65)
            count.sSectionName_trans = GetSlug(count.sSectionName_ru)
            count.save()
            # print u"id:",count.id, \
            #     u"|\tname:", count.sSectionName_ru, \
            #     u"|\tвложеность:", count.iNesting, \
            #     u"|\tцепочка:", count.lParentChain, \
            #     u"|\tюнисортер:", count.sbSortTree, \
            #     u"|\tтип_дерева:", count.iSectionType
            hlop_hlop( count.id, count.iNesting, count.lParentChain, count.sbSortTree, count.iSectionType )
            iteration += 1
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Добавление категории в корень
def add_to_root (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        if 'category_to_root' in request.POST and 'SectionType' in request.POST:
            # print request.POST['SectionType']
            AddSection = TreeClassify(
                sSectionName_ru=request.POST['category_to_root'],
                sSectionName_trans=GetSlug(request.POST['category_to_root']),
                iNesting=0,
                lParentChain=0,
                kParent_id=None,
                iSectionType = int(request.POST['SectionType']),
                )
            AddSection.save()
            AddSection.lParentChain=AddSection.id
            AddSection.save()
            # добавляем новую RUS-пару в LangMatch как активную
            item = LangMatch (kTreeClassify_id = AddSection.id,
                              sLangType = 'RUS',
                              sSectionNameForeign = AddSection.sSectionName_ru,
                              bSectionTranslateActual = True,
                              bSectionMastTranslate = False,
                              bSectionMastCheck = False,
                              sSectionNameSlug = AddSection.sSectionName_trans)
            item.save()
            # а теперь надо все дерево пересортировать (долго и нудно) как в recheck
            # queryTree = TreeClassify.objects.filter(kParent_id=None).order_by('sSectionName_ru')
            # iteration = 0
            # for count in queryTree:
            #     count.iNesting = 0
            #     count.lParentChain = "%d" % count.id
            #     count.sbSortTree = unichr(iteration+65)
            #     count.sSectionName_trans = GetSlug(count.sSectionName_ru)
            #     count.save()
            #     hlop_hlop(  count.id, count.iNesting, count.lParentChain, count.sbSortTree, count.iSectionType )
            #     iteration += 1
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': AddSection.id})
            dimention_to_template.update({'MSG': u"Добавили в корень «%s» (ID&nbsp;%d)" % (request.POST['category_to_root'], AddSection.id)})

    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Добавление подкатегории к разделу
def add_subpart (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        if 'list_of_subparts' in request.POST and 'AddSubSectionToID' in request.POST:
            toMark = "0"
            q = TreeClassify.objects.get(id=request.POST['AddSubSectionToID'])
            listSubP = request.POST['list_of_subparts'].split('\n')
            for i in range(0, len(listSubP)):
                listSubP[i] = re.sub(r'\s+', ' ', listSubP[i])
                listSubP[i] = re.sub(r'^\s+', '', listSubP[i])
                listSubP[i] = re.sub(r'\s+$', '', listSubP[i])
                AddRec = TreeClassify(
                    sSectionName_ru=listSubP[i],
                    sSectionName_trans=GetSlug(listSubP[i]),
                    iNesting=q.iNesting+1,
                    kParent_id=q.id,
                    )
                AddRec.save()
                AddRec.lParentChain=q.lParentChain+','+str(AddRec.id)
                AddRec.save()
                # добавляем новую RUS-пару в LangMatch как активную
                item = LangMatch (kTreeClassify_id = AddRec.id,
                                  sLangType = 'RUS',
                                  sSectionNameForeign = AddRec.sSectionName_ru,
                                  bSectionTranslateActual = True,
                                  bSectionMastTranslate = False,
                                  bSectionMastCheck = False,
                                  sSectionNameSlug = AddRec.sSectionName_trans)
                item.save()
                toMark += ','+str(AddRec.id)
            # а теперь надо пересортировать все что относится к робителю, в которого прилетели подразделы
            hlop_hlop(  q.id, q.iNesting, q.lParentChain, q.sbSortTree, q.iSectionType )
            dimention_to_template.update({'MSG': u"Добавили подкатегории «%s»" % request.POST['list_of_subparts']})
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': toMark})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Удаление категории и всех ее подкатегорий
def del_part_and_subpart (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DEL': 0})
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': ''})
    if request.method == 'POST':
        if 'DelSectionID' in request.POST and 'yes_del_parts' in request.POST:
            yes = request.POST['yes_del_parts']
            if yes.upper() in ['YES',u'да',u'Да',u'ДА',u'дА']:
                # надо найти всех детей этого DelSectionID
                toMark = ''
                children = []
                R = TreeClassify.objects.get(id=request.POST['DelSectionID'])
                # запоминаем родителя, для последующей переиндексации его веточки
                # parrrent = R.kParent_id
                # получаем всех детей всех вложений
                P = TreeClassify.objects.filter(lParentChain__istartswith=R.lParentChain)
                # P = TreeClassify.objects.all()
                for count in P:
                    try:
                        # помечаем для удаленной записи пары в LangMatch как архивные (для всех языков)
                        LM = LangMatch.objects.filter(kTreeClassify_id = count.id, bSectionTranslateActual = True)
                        for i in LM:
                            i.bSectionTranslateActual = False
                            i.save()
                        # удаляем алиасы назначенные на удаляемый подраздел
                        qDropAlias = TreeClassify.objects.filter(kAlias_id=count.id)
                        for wAli in qDropAlias:
                            wAli.kAlias_id = None
                            toMark += "%d," % wAli.id
                            # print u"сняли алиас с id:", wAli.id
                            wAli.save()
                        # удаляем категорию
                        # print u"удалили id:", count.id
                        count.delete()
                        children.append(count.id)
                    except:
                        pass
                # print toMark
                dimention_to_template.update({'MSG': u"Удалили нафиг ID «%s»" % children})
                dimention_to_template.update({'SOMETHING_DEL': children})
                dimention_to_template.update({'SOMETHING_DO_WITH_ID': toMark[:-1]})
                # а теперь надо пересортировать все что относится к робителю, из которого удалили раздел
                # хотя, по большому, счету при удалении пересортировыват вообще не обязательно
                # само переиндексируется при каких-нибудь следующих действиях
                # hlop_hlop(  R.id, R.iNesting, R.lParentChain, R.sbSortTree, R.iSectionType )
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Изменение названия раздела
def edt_part (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        if 'EdtSectionID' in request.POST and 'new_name_of_parts' in request.POST:
            if 'worker' in request.POST:
                template = "informer1.html" # шаблон
            # получаеМ
            R = TreeClassify.objects.get(id=request.POST['EdtSectionID'])
            # меняем название и транслит
            name = re.sub(r'\s+', ' ', request.POST['new_name_of_parts'])
            name = re.sub(r'^\s+', '', name)
            name = re.sub(r'\s+$', '', name)
            R.sSectionName_ru = name
            R.sSectionName_trans = GetSlug(name)
            R.save()
            # помечаем старые пары в LangMatch как архивные (для всех языков)
            P = LangMatch.objects.filter(kTreeClassify_id = R.id, bSectionTranslateActual = True)
            for i in P:
                i.bSectionTranslateActual = False
                i.save()
            # добавляем новую RUS-пару в LangMatch как активную
            item = LangMatch (kTreeClassify_id = R.id,
                              sLangType = 'RUS',
                              sSectionNameForeign = R.sSectionName_ru,
                              bSectionTranslateActual = True,
                              bSectionMastTranslate = False,
                              bSectionMastCheck = False,
                              sSectionNameSlug = R.sSectionName_trans)
            item.save()
            # а теперь надо пересортировать все что относится к родителю, в котолром переименовали раздел
            # а перед этим найти этого родителя
            Rec = TreeClassify.objects.get(id=R.kParent_id)
            hlop_hlop(  Rec.id, Rec.iNesting, Rec.lParentChain, Rec.sbSortTree, Rec.iSectionType )
            dimention_to_template.update({'MSG': u"Переименовали ID «%s»" % R.id})
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': R.id})

    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Сделать (или наоборот) подраздел как Alias и всяка хрень с этим связанная
def edt_make_alias (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        if 'alias_name_of_parts' in request.POST and 'AliasSectionID' in request.POST:
            if 'command_remove_alias' not in request.POST:
                # выковыриваем цифры из начала строки
                try:
                    akaID = int(re.compile(r'^\d*').match(request.POST['alias_name_of_parts']).group(0))
                    # print akaID
                    # получаем запись
                    R = TreeClassify.objects.get(id=request.POST['AliasSectionID'])
                    # меняем название Alias
                    R.kAlias_id = akaID
                    R.save()
                    dimention_to_template.update({'MSG': u"Раздел с «ID:%s» назачен как Alias для Aka «ID:%d»" % (request.POST['AliasSectionID'], akaID )})
                    dimention_to_template.update({'SOMETHING_DO_WITH_ID': request.POST['AliasSectionID']})
                    dimention_to_template.update({'SOMETHING_MAKE_AS_AKA': akaID})
                except:
                    pass
            else:
                try:
                    R = TreeClassify.objects.get(id=request.POST['AliasSectionID'])
                    R.kAlias_id = None
                    R.save()
                    dimention_to_template.update({'SOMETHING_DO_WITH_ID': R.id})
                    #print request.POST['command_remove_alias']
                    #print request.POST['AliasSectionID']
                except:
                    pass
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Перенос категории и всех ее подкатегорий
def move_subpart (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': ''})
    if request.method == 'POST':
        if 'AcceptorMoveSectionID' in request.POST and 'movable_name_of_parts' in request.POST:
            # надо найти всех детей этого movable_name_of_parts
            # выковыриваем числовой ID из названия перносимого раздела
            movID = int(re.compile(r'^\d*').match(request.POST['movable_name_of_parts']).group(0))
            children = []
            toMark = ''
            R = TreeClassify.objects.get(id=movID)
            oldMovableRoot = R.lParentChain
            qAcceptor = TreeClassify.objects.get(id=int(request.POST['AcceptorMoveSectionID']))
            AcceptorPath = qAcceptor.lParentChain
            ## print u"accept:", AcceptorPath, qAcceptor.sSectionName_ru
            newMovableRoot = AcceptorPath + ",%d" % R.id
            ## print u"newroot:", newMovableRoot
            qMovableChildren = TreeClassify.objects.filter(lParentChain__startswith=oldMovableRoot)
            R.kParent_id = int(request.POST['AcceptorMoveSectionID'])
            R.save()
            # помечаем в таблице переводов как требующие проверки соотвествующие разделы на всех яхыках (кроме 'RUS')
            LangMatch.objects.filter(kTreeClassify_id=R.id,
                                     bSectionMastTranslate=False,
                                     bSectionTranslateActual=True).exclude(sLangType='RUS').update(bSectionMastCheck = True,
                                                                                                   dSectionTranslateModify = timezone.now())
            for count in qMovableChildren:
                toMark += "%d," % count.id
                ## print u"child:", count.lParentChain, count.sSectionName_ru
                chain = count.lParentChain.replace(oldMovableRoot, newMovableRoot)
                count.lParentChain = chain
                count.iNesting = len(list(chain.split(',')))-1
                count.save()
                # помечаем в таблице переводов как требующие проверки соотвествующие разделы на всех яхыках (кроме 'RUS')
                LangMatch.objects.filter(kTreeClassify_id=count.id,
                                     bSectionMastTranslate=False,
                                     bSectionTranslateActual=True).exclude(sLangType='RUS').update(bSectionMastCheck = True,
                                                                                                   dSectionTranslateModify = timezone.now())

            # а теперь надо пересортировать все что относится к новым родителям, в который переинесли раздел
            # а вот старых родителей можно не трогать. Как-нибудь само переиндексируется после
            # и еще надо найти раителя нового
            Rec = TreeClassify.objects.get(id=R.kParent_id)
            hlop_hlop(  Rec.id, Rec.iNesting, Rec.lParentChain, Rec.sbSortTree, Rec.iSectionType )

            dimention_to_template.update({'MSG': u"Перенесли ID «%s»" % children})
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': toMark[:-1]})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Автокомлит для категорий
def autocomplete_sect (request):
    tStart = clock()
    msg = u""
    if request.method == 'GET':
        if 'term' in request.GET and 'csrfmiddlewaretoken' in request.GET:
            part = re.split ("[, /;|]*", urllib.unquote(request.GET['term']))
            SQLquery = u"WHERE "
            for i in part[:-1]:
                SQLquery += u"concat(classifier_treeclassify.id, ': ', classifier_treeclassify.sSectionName_ru) LIKE '%%%s%%' AND \n" % i
            SQLquery += u"concat(classifier_treeclassify.id, ': ', classifier_treeclassify.sSectionName_ru) LIKE '%%%s%%'" % part[-1] # последний элемент сравнения бля WHERE должен бть без AND
            SQLquery = "SELECT \n" \
                       "  classifier_treeclassify.id, \n" \
                       "  classifier_treeclassify.sSectionName_ru \n" \
                       "FROM classifier_treeclassify \n" + SQLquery + " \nLIMIT 10;"
            cursor = connection.cursor()
            cursor.execute(SQLquery)
            for row in cursor.fetchall():
                # msg += '"%s (id:%d)",' % (row[1].replace(u"\"", u"”").replace(u"\'", u"’"), row[0])
                msg += '"%05d: %s",' % (row[0], row[1].replace(u"\"", u"”").replace(u"\'", u"’"))
    #msg = '[' + msg +  u'"Время: %.4f"]' % float(clock()-tStart)
    msg = '[' + msg[:-1] + ']'
    # print msg
    return HttpResponse ( msg )


# Инструменты поиска алиасов
def aliasmanager (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "aliaser.html" # шаблон
    MarkRowWithID = []
    if request.method == 'GET':
        if 'to_do' in request.GET:
            # MarkRowWithID = int(request.GET['to_do'])
            MarkRowWithID = request.GET['to_do'].split(',')
            for countSection in range(0, len(MarkRowWithID)):
                try:
                    MarkRowWithID[countSection] = int(MarkRowWithID[countSection])
                except:
                    pass
            # MarkRowWithID.append(int(request.GET['to_do']))
        if 'to_aka' in request.GET:
            try:
                dimention_to_template.update({'MAKE_AKA': [int(request.GET['to_aka'])]})
            except:
                pass

    dimention_to_template.update({'MAKE_LIGHT': MarkRowWithID})
    NumViz = 0 # как будто первый визит
    if 'NumVisit' in request.COOKIES:
         # стоят кукии, и это не первый визит
         NumViz = request.COOKIES['NumVisit'] # читаем из кук число визитов
         NumViz = int(NumViz) + 1             # увеличиваем порядковый номер визитов

    # поиск алаас-кандидатов
    qAliasCandidat = TreeClassify.objects.raw(
        u"SELECT" \
        u"  classifier_treeclassify.sSectionName_ru AS id," \
        u"  COUNT(classifier_treeclassify.sSectionName_ru) AS INTERSEC " \
        u"FROM classifier_treeclassify " \
        u"GROUP BY classifier_treeclassify.sSectionName_ru " \
        u"HAVING COUNT(classifier_treeclassify.sSectionName_ru) > 1 " \
        u"ORDER BY" \
        u"   INTERSEC," \
        u"   classifier_treeclassify.sSectionName_ru;" \
    )
    dimention_to_template.update({'NUM_T': len(list(qAliasCandidat))})
    DimAlias = []
    for count in qAliasCandidat:
        qInAlias = TreeClassify.objects.filter(sSectionName_ru=count.id).order_by('sbSortTree')
        InAliasSet = []
        for iid in qInAlias:
            path = ""
            Chain = iid.lParentChain.split(',')
            for count_chain in Chain[0:-1]:
                queryTMP = TreeClassify.objects.get(id=int(count_chain))
                path += queryTMP.sSectionName_ru + ' / '
            ItemInAlias = {
                'path_s': path,
                'id_s': iid.id,
                'alias_s': iid.kAlias_id
            }
            InAliasSet.append(ItemInAlias)
        # print InAliasSet
        DimAlias.append({ 'name': count.id,
                          'inset': InAliasSet })
        #print count.id, count.INTERSEC
    #print DimAlias

    dimention_to_template.update({'ALIAS_ARR': DimAlias})
    # dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    dimention_to_template.update({'NV': NumViz})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    response.set_cookie("NumVisit",  NumViz, max_age=604800) ## ставим или перезаписывем куки (неделя)
    return response


# Склеиватель алиасов в инструментах поиска алиасов
def aliasmarker (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "informer1.html" # шаблон
    if request.method == 'POST':
        something_do = u''
        if 'alias' in request.POST and 'aka' in request.POST:
            for count_alias in request.POST.getlist('alias'):
                q2Alias = TreeClassify.objects.get(id=int(count_alias))
                q2Alias.kAlias_id = int(request.POST['aka'])
                q2Alias.save()
                something_do += "%d," % int(count_alias)
            # print something_do
            q2aka = TreeClassify.objects.get(id=int(request.POST['aka']))
            q2aka.kAlias_id = None
            q2aka.save()
        dimention_to_template.update({'SOMETHING_DO_WITH_ID': something_do[:-1]})
        dimention_to_template.update({'SOMETHING_MAKE_AS_AKA': request.POST['aka']})
        dimention_to_template.update({'MSG': u"Рулю аласами ID «%s»" % something_do[:-1]})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Глюкало, строит дерево с помощью Google Chats
def glukalo1 (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "glukalo_1.html" # шаблон

    NumViz = 0 # как будто первый визит
    if 'NumVisit' in request.COOKIES:
         # стоят кукии, и это не первый визит
         NumViz = request.COOKIES['NumVisit'] # читаем из кук число визитов
         NumViz = int(NumViz) + 1             # увеличиваем порядковый номер визитов

    queryTree = TreeClassify.objects.order_by('iSectionType').order_by('sbSortTree') #.filter(iNesting=0)
    Data = []
    for countSection in queryTree:
        # path = u""
        #Chain = countSection.lParentChain.split(',')
        #for count in Chain[0:-1]:
        #    queryTMP = TreeClassify.objects.get(id=count)
        #    path += queryTMP.sSectionName_ru + ' / '
        # path += countSection.sSectionName_ru
        Data.append( u"root " + countSection.sSectionName_ru )
    # TreeData.sort(key=lambda countSection: countSection['path'])
    dimention_to_template.update({'DATA': Data})
    dimention_to_template.update({'NV': NumViz})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    response.set_cookie("NumVisit",  NumViz, max_age=604800) ## ставим или перезаписывем куки (неделя)
    return response


# Глюкало, строит дерево с помощью Google Chats
def glukalo2 (request):
    tStart = clock()
    # проверка на аутентификацию
    # if not request.user.is_authenticated():
    #     return HttpResponseRedirect("/not-denice")
    dimention_to_template = {}
    template = "glukalo_2.html" # шаблон
    NumViz = 0 # как будто первый визит
    if 'NumVisit' in request.COOKIES:
         # стоят кукии, и это не первый визит
         NumViz = request.COOKIES['NumVisit'] # читаем из кук число визитов
         NumViz = int(NumViz) + 1             # увеличиваем порядковый номер визитов


    # перебор видов деревьев
    # for i in SECTION_TYPE:
    #     print i[0]

    Data = []
    queryTree = TreeClassify.objects.order_by('iSectionType').order_by('sbSortTree') #.filter(iNesting=0)
    for countSection in queryTree:
        path = u""
        Chain = countSection.lParentChain.split(',')
        queryTMP = TreeClassify.objects.filter(id__in=Chain[0:-1]).order_by('sbSortTree')
        for i in queryTMP:
            path += i.sSectionName_ru + ' '
        path += countSection.sSectionName_ru
        Data.append( u"root " + path )

    dimention_to_template.update({'DATA': Data})
    dimention_to_template.update({'NV': NumViz})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    response.set_cookie("NumVisit",  NumViz, max_age=604800) ## ставим или перезаписывем куки (неделя)
    return response



# Глюкало, строит дерево с помощью Google Chats
def not_denice (request):
    tStart = clock()
    dimention_to_template = {}
    template = "not_denice.html" # шаблон
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response
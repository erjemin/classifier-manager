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
from classifier.models import TreeClassify
from django.contrib.auth.decorators import login_required
from django.db import connection
from time import clock
import httplib                                  # библиотека работы с HTTP (скачиваем ссылки и все такое)
import json
import re
import urllib
import datetime
from add_func import GetSlug

from django.template import loader, Context

import random
import time

def index (request) :
    tStart = clock()
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

    # вывод дерева
    queryTree = TreeClassify.objects.all().filter(iSectionType=1) #.filter(iNesting=0)
    dimention_to_template.update({'NUM_T': queryTree.count()})
    TreeData = []
    maxNest = 0
    levNest = []
    for countSection in queryTree:
        lag = u""
        path = u""
        if maxNest < countSection.iNesting:
            maxNest = countSection.iNesting
            levNest.append(maxNest)
        Chain = countSection.lParentChain.split(',')
        for count in Chain[0:-1]:
            queryTMP = TreeClassify.objects.get(id=count)
            path += queryTMP.sSectionName_ru + ' / '
            lag += u" ├──"
        path += countSection.sSectionName_ru
        strII = lag+countSection.sSectionName_ru
        strII = strII.replace(u"├── ", u"│   ")
        TreeData.append({
            'id': countSection.id,
            'path': path,
            'nest': countSection.iNesting,
            'alias': countSection.kAlias_id,
            'sSectionName_ru': strII,
            'sSectionName_trans': countSection.sSectionName_trans
        })
    TreeData.sort(key=lambda countSection: countSection['path'])
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

    # response = render (request, template, dimention_to_template)
    # return response


# Добавление категории в корень
def add_to_root (request):
    tStart = clock()
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        if 'category_to_root' in request.POST:
            AddSection = TreeClassify(
                sSectionName_ru=request.POST['category_to_root'],
                sSectionName_trans=GetSlug(request.POST['category_to_root']),
                iNesting=0,
                lParentChain=0,
                )
            AddSection.save()
            AddSection.lParentChain=AddSection.id
            AddSection.save()
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': AddSection.id})
            dimention_to_template.update({'MSG': u"Добавили в корень «%s» (ID&nbsp;%d)" % (request.POST['category_to_root'], AddSection.id)})

    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response



# Добавление подкатегории к разделу
def add_subpart (request):
    tStart = clock()
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
                toMark += ','+str(AddRec.id)
            dimention_to_template.update({'MSG': u"Добавили подкатегории «%s»" % request.POST['list_of_subparts']})
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': toMark})

    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Удаление категории и всех ее подкатегорий
def del_part_and_subpart (request):
    tStart = clock()
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DEL': 0})
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': ''})
    if request.method == 'POST':
        if 'DelSectionID' in request.POST and 'yes_del_parts' in request.POST:
            yes = request.POST['yes_del_parts']
            if yes.upper() in ['YES',u'да',u'Да',u'ДА',u'дА']:
                # надо найти всех детей этого DelSectionID
                children = []
                toMark = ''
                R = TreeClassify.objects.get(id=request.POST['DelSectionID'])
                # P = TreeClassify.objects.filter(lParentChain__contains=R.lParentChain)
                P = TreeClassify.objects.all()
                children.append(R.id)
                for count in P:
                    if re.match(R.lParentChain+',', count.lParentChain):
                        children.append(count.id)
                for count in children:
                    try:
                        R = TreeClassify.objects.get(id=count)
                        qDropAlias = TreeClassify.objects.filter(kAlias_id=R.id)
                        for wAli in qDropAlias:
                            wAli.kAlias_id = None
                            wAli.save()
                            toMark += "%d," % wAli.id
                        R.delete()
                    except:
                        pass
                dimention_to_template.update({'MSG': u"Удалили нафиг ID «%s»" % children})
                dimention_to_template.update({'SOMETHING_DEL': children})
                dimention_to_template.update({'SOMETHING_DO_WITH_ID': toMark[:-1]})

    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Изменение названия раздела
def edt_part (request):
    tStart = clock()
    dimention_to_template = {}
    template = "informer.html" # шаблон
    dimention_to_template.update({'SOMETHING_DO_WITH_ID': 0})
    if request.method == 'POST':
        if 'EdtSectionID' in request.POST and 'new_name_of_parts' in request.POST:
            # получаеМ
            R = TreeClassify.objects.get(id=request.POST['EdtSectionID'])
            # меняем название и транслит
            name = re.sub(r'\s+', ' ', request.POST['new_name_of_parts'])
            name = re.sub(r'^\s+', '', name)
            name = re.sub(r'\s+$', '', name)
            R.sSectionName_ru = name
            R.sSectionName_trans = GetSlug(name)
            R.save()
            dimention_to_template.update({'MSG': u"Переименовали ID «%s»" % R.id})
            dimention_to_template.update({'SOMETHING_DO_WITH_ID': R.id})

    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response


# Сделать (или наоборот) подраздел как Alias и всяка хрень с этим связанная
def edt_make_alias (request):
    tStart = clock()
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
            for count in qMovableChildren:
                toMark += "%d," % count.id
                ## print u"child:", count.lParentChain, count.sSectionName_ru
                chain = count.lParentChain.replace(oldMovableRoot, newMovableRoot)
                count.lParentChain = chain
                count.iNesting = len(list(chain.split(',')))-1
                count.save()
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

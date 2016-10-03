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
from classifier.models import TreeClassify, LangMatch, dataPulscen
from django.db.models import Count
from django.core.files import File
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required
from django.db import connection

from time import clock
import httplib                                  # библиотека работы с HTTP (скачиваем ссылки и все такое)
import json
import re
from datetime import datetime
from add_func import GetSlug
from classifier.models import SECTION_TYPE, LANGUAGE_TYPE
from classifier.settings import STATIC_BASE_PATH
from django.template import loader, Context
import os
import random

# для анализа даных и машинного обучения нужно установить кучу библиотек
# pip install stop-words  ## стоп-слова для разных языков (союзы, предлоги и пр.)
# библиотека seaborn и scikit-learn имеет в составе части, которые не всегда ставялтся из коробки
# pip install numpy-1.11.1+mkl-cp27-cp27m-win32.whl       ## поддержка многомерных массивово и высшая математика
                                                          ## (нужна версия +mkl -- многопотоковые вычисления)
# python -m pip install scipy-0.18.1-cp27-cp27m-win32.whl ## математические и научные расчеты N-мерных массивов
# pip install pandas                    ## анализ, таблицы, группировки, доступ к данным SQL, TXT, Excel-файлы, HTML
# pip install matplotlib                ## визуализация данных (2D- и 3D-графики, искрографики)
# pip install seaborn                   ## обвязка над matplotlib -- улучшение отображения графиков
# pip install -U scikit-learn           ## алгоритмы машинного обучения

from sklearn.feature_extraction.text import CountVectorizer
from stop_words import get_stop_words
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2
import seaborn as sns
from sklearn.metrics import pairwise_distances

import numpy
import urllib

# сервисная функция.
def analiz01 (request):
    tStart = clock()
    # получаем данные
    q = dataPulscen.objects.get(id=1)
    print q.pul_category
    print q.pul_name
    print q.pul_properties
    print q.pul_description

    from sklearn.datasets import fetch_20newsgroups
    categories = ['alt.atheism', 'soc.religion.christian',]
                  # 'comp.graphics', 'sci.med']
    msg = fetch_20newsgroups(subset='train',
                             categories=categories,
                             shuffle=True, random_state=42)
    msg = str(msg).encode('utf-8').replace("\\n","<br>")
    # msg = str(msg).encode('utf-8').replace("\\n","<br>")
    # print str(msg).encode('utf-8').replace("\\n","<br>")


    # # пример
    # url = u"http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/pima-indians-diabetes.data"
    # # download the file
    # raw_data = urllib.urlopen(url)
    # # загркжаем CSV-файл как numpy-матрицу
    # dataset = numpy.loadtxt(raw_data, delimiter=",")
    # # print dataset
    # # отделяем данные (X) от целевых значений (y)
    # X = dataset[:,0:7]
    # y = dataset[:,8]
    #
    # # print u"X:", X
    # # print u"y:", y
    #
    # from sklearn import preprocessing
    # # нормализуем данные (normalize the data attributes)
    # # Нормализация -- замена номинальных признаков так, чтобы каждый из них лежал в диапазоне от 0 до 1
    # normalized_X = preprocessing.normalize(X)
    # # стандартизуем данные (standardize the data attributes)
    # # Стандартизация -- замена данных, после которой каждый признак имеет среднее 0 и дисперсию 1.
    # standardized_X = preprocessing.scale(X)
    # # print "normalized_X:\n", normalized_X, "standardized_X:\n", standardized_X
    #
    # # отбираем признаки деревом-решений (древесным) аглоритмом
    #
    # from sklearn import metrics
    # from sklearn.ensemble import ExtraTreesClassifier
    # model = ExtraTreesClassifier()
    # model.fit(X, y)
    # # display the relative importance of each attribute
    # print(model.feature_importances_)


    # cv = CountVectorizer(input=u"контент", # список файлов или контент
    #                      stop_words=get_stop_words("russian"))
    # corpus_tdm = cv.fit_transform([u"тренировочный набор",])  # строка или список файлов на котором
    #
    # ch2 = SelectKBest(chi2, k=3)
    # # traning_labels -- список принадлежности к матице
    # # tdmnew = ch2.fit_transform(corpus_tdm, "traning_labels")
    # # tdmnew = ch2.fit_transform(corpus_tdm, u"ура")
    # # tdmnew = ch2.fit_transform(corpus_tdm, (1, 2))
    # print u"ch2", ch2
    #
    # # euclian_distance_matrix = pairwise_distances(tdmnew)
    # euclian_distance_matrix = pairwise_distances(ch2)
    # sns.heatmap(euclian_distance_matrix,
    #             xticklabels=u"контент",
    #             yticklabels=u"контент")
    # sns.plt.show()

    dimention_to_template = {}   # словарь, для передачи шаблону
    template = "analiz_info.html" # шаблон

    # действия для русского языка, как базового
    dimention_to_template.update({'MSG': msg})
    dimention_to_template.update({'TAU': float(clock()-tStart)})
    response = render (request, template, dimention_to_template)
    return response
# -*- coding: utf-8 -*-
"""
Django settings for classifier project.

Generated by 'django-admin startproject' using Django 1.9.7.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""

import os
import socket
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ADMINS = (
    ('Sergey Erjemin', 'erjemin@cargotogo.com'),
    # ('еще кто-то', 'e-serg@mail.ru'),
)
#########################################
# настройки для почтового сервера
EMAIL_HOST  = '.com' # SMTP server
EMAIL_PORT  = 465 # для SSL/https
MAIL_HOST_USER = '' # login if requared or ''
EMAIL_HOST_PASSWORD = 'не скажу'       # '' password
EMAIL_USE_TLS = True

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'v%jmws#m_p_7^6mnq8w=&m$4kc-nkq@x1s6w2z3cy)*qy8gmw)'

ALLOWED_HOSTS = [
    '127.0.0.1',            # Allow domain and subdomains
    'localhost',
    'tree.cube2.ru'           # Also allow FQDN and subdomains
    ]
SITE_ID = 1

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'classifier',
    'web',
]

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',  # пакет извещения о "битых" ссылках.
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # Раскомментируйте следующую строку для защиты Clickjacking::
    'django.middleware.clickjacking.XFrameOptionsMiddleware', # для управления  X-Frame-Options в HTTP-заголовках
)

ROOT_URLCONF = 'classifier.urls'



WSGI_APPLICATION = 'classifier.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases

DATABASES = {
    'default': {
        # для SQLite3
        #'ENGINE': 'django.db.backends.sqlite3',
        #'NAME': os.path.join(BASE_DIR, 'db_classifier.sqlite3'),
        # для MySQL
        # Это подсоединение к внутренней виртулке VirtualBox
        # 
        'ENGINE': 'django.db.backends.mysql',
        'HOST': '192.168.56.1',   # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '3306',              # Set to empty string for default. Not used with sqlite3.
        'NAME': 'django_classify',                  # Not used with sqlite3.
        'USER': 'serg',                      # Not used with sqlite3.
        'PASSWORD': 'qwas',                  # Not used with sqlite3.
        'OPTIONS': {
          'autocommit': True,
        }
    }
}



# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    { 'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator', },
    { 'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator', },
    { 'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator', },
    { 'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator', },
]


# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/
LANGUAGE_CODE = 'ru-RU'         # <--------- RUSSIAN
TIME_ZONE = 'Europe/Moscow'     # <--------- RUSSIAN (MOSCOW)

USE_I18N = True
USE_L10N = True
USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/

STATIC_URL = '/static/'

MEDIA_URL = '/media/'
STATIC_URL = '/static/'
# ЕСЛИ НЕ В ПРОДАШЕНЕ ТО ПЕРЕОПРЕДЕЛЯЕМ
if (socket.gethostname() == 'ASUS_p8p67le') or \
   (socket.gethostname() == 'DESKTOP-H7T9VUD') or \
   (socket.gethostname() == "E-SIEMENS"):
    DEBUG = True
    if (socket.gethostname() == 'DESKTOP-H7T9VUD'):
        STATIC_ROOT         = 'C:/Users/manager/PycharmProjects/classifier-manager/static'
        STATIC_BASE_PATH    = 'C:/Users/manager/PycharmProjects/classifier-manager/static'
        MEDIA_ROOT          = 'C:/Users/manager/PycharmProjects/classifier-manager/media'
    if (socket.gethostname() == 'ASUS_p8p67le'):
        STATIC_ROOT         = 'C:/Users/Sergei/Cloud Mail.ru/PRJ/PRJ Cargo2Go classifier/classifier-manager/static'
        STATIC_BASE_PATH    = 'C:/Users/Sergei/Cloud Mail.ru/PRJ/PRJ Cargo2Go classifier/classifier-manager/static'
        MEDIA_ROOT          = 'C:/Users/Sergei/Cloud Mail.ru/PRJ/PRJ Cargo2Go classifier/classifier-manager/media'
    #  ___    ____      _              _____         _ _              _____             _
    # | | |  |    \ ___| |_ _ _ ___   |_   _|___ ___| | |_ ___ ___   |  _  |___ ___ ___| |
    # |_  |  |  |  | -_| . | | | . |    | | | . | . | | . | .'|  _|  |   __| .'|   | -_| |
    #   |_|  |____/|___|___|___|_  |    |_| |___|___|_|___|__,|_|    |__|  |__,|_|_|___|_|
    #                          |___|
    INTERNAL_IPS = ( '127.0.0.1', )
    INSTALLED_APPS += ( 'debug_toolbar', )
    MIDDLEWARE_CLASSES += ( 'debug_toolbar.middleware.DebugToolbarMiddleware', )
    DEBUG_TOOLBAR_PANELS = [
    #    'debug_toolbar.panels.versions.VersionsPanel',
        'debug_toolbar.panels.timer.TimerPanel',
        'debug_toolbar.panels.settings.SettingsPanel',
        'debug_toolbar.panels.headers.HeadersPanel',
        'debug_toolbar.panels.request.RequestPanel',
        'debug_toolbar.panels.sql.SQLPanel',
        'debug_toolbar.panels.staticfiles.StaticFilesPanel',
        'debug_toolbar.panels.templates.TemplatesPanel',
        'debug_toolbar.panels.cache.CachePanel',
        'debug_toolbar.panels.signals.SignalsPanel',
        'debug_toolbar.panels.logging.LoggingPanel',
        'debug_toolbar.panels.redirects.RedirectsPanel',
         ]
    DEBUG_TOOLBAR_CONFIG = {
        'EXCLUDE_URLS': ('/admin',), # не работает, но когда-нибудь будет работать...
        'INTERCEPT_REDIRECTS': False,
        }
else: # НАЗНАЧЕНИЕ ДИРЕКТОРИЙ ДЛЯ ПРОДАКШН-СЕРВЕРА (ХОСТЕРА)
    DEBUG = False
    STATIC_ROOT = os.path.dirname(BASE_DIR) + '/public/static/'
    STATIC_BASE_PATH = os.path.dirname(BASE_DIR) + '/public/static/'
    MEDIA_ROOT  = os.path.dirname(BASE_DIR) + '/public/media/'
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    ('js',  STATIC_BASE_PATH + '/js'),
    ('img', STATIC_BASE_PATH + '/img'),
    ('css', STATIC_BASE_PATH + '/css'),
    ('csv', STATIC_BASE_PATH + '/csv'),
)

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(BASE_DIR, 'templates'),
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'debug': DEBUG,
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                #'allauth.account.context_processors.account',
                # 'allauth.socialaccount.context_processors.socialaccount',
            ],
        },
    },
]


STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)



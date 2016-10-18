Как развертывать под Linux
==============================

В моем случае под Debian GNU/Linux установленом на Raspberry pi 3.
Развертывание под другие разновидности Debian (Ubuntu, Runtu, gNewSense и пр.) не должно отличаться.

На нашем микросервере Raspberry pi уже есть супер пользователь по умолчанию -- **pi**. У него есть доступом по SSH. Но в силу того, что такой пользователь есть на всех Raspberry pi, то лучше закрыть ему доступ, создать нового пользователя и выполнять команды и, и запускать нужные нам сервисы от его имени. Наш пользователь будет называться **[user]**, замените его на своего.

Создание пользователя и SSH-доступа
----------------------------------

Первым делом нам понадобтся настроить пользователя, от имени которого мы будем работать и SSH-доступ для него.

Наше пользователя надо включить в группу `www-data`, которую будет использовать web-сервер:
`sudo usermod -g www-data [user]`




Во-вторых, нам монадобится сервер базы данных МySQL. Устанавим его:

-----

Установка и настройка сервера MySQL
-----------------------------------

Установка сервера базы данных исключительно проста. Достаточно одной команды:
```
sudo apt-get install mysql-server
```

В процессе установки будет дважды запрошен пароль **root**-сперпользователя базы. Лучше чтобы он был посложнее и отличался от пароля нашего текущего (и всех остальных) пользователей. Так как мы будет использовать его дальше в инструкции. то обозначим его: «_secret_password_mysql_root_»

Теперь у нас есть MySQL. Заходим в него под root-пользователем.
```bash
mysql -u root -p secret_password_mysql_root
```

Появится сообщение:
```sql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 38
Server version: 5.5.52-0+deb8u1 (Raspbian)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

Поздравляю, мы внутри консольного клиента MySQL. Создаем базу данных нашего проекта **(django_classify)**:
```sql
CREATE DATABASE django_classify DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
```
Затем, чтобы наше Django-приложение не работало с базой от супер-пользователя **root** создаем нового пользователя бызы **[user]** с паролем «_secret_password_mysql_user_»:
```sql
GRANT ALL PRIVILEGES ON django_classify.* TO '[user]'@'localhost' IDENTIFIED BY 'secret_password_mysql_user' WITH GRANT OPTION;
```

Если по какой либо причине, нам понадобится удаленный доступ от имени этого пользователя (например, для работы с базой с помощью удаленного менеджера, на подобии dbForge Studio), то можно заменить `'localhost'` на `'%'`. Если захотим разрешить этому пользователю доступ и ко всем другим базам в нашем MySQL, то необходимо заменить `PRIVILEGES ON django_classify.*` на  `PRIVILEGES ON *.*`.

Работа с базой закончена. Можно выйти из MySQL `Ctrl+Z`.

Если мы создали MySQL пользователя с возможностью удаленного доступа, то нам понадобиться изменить конфигурационный файл MySQL. Открываем его на редактирование:

```
sudo nano /etc/mysql/my.cnf
```
Находим строчку `bind-address = 127.0.0.1` и комментим ее `# bind-address = 127.0.0.1` или если даем доступ только с определнного IP, то указываем его:`bind-address = 192.168.1.40`. Более сложные правила доступа следует настраивать через firewall.

Сохраняем конфиг-файл MySQL `Ctrl+O`, `Enter` и `Ctrl+X`, а затем, перезапускаем MySQL чтобы изменения конфигурационного файла подействовали.
```
sudo service mysql restart
```

MySQL и база проекта настроены. Теперь нам нужно настроить виртуальное окружение проекта.

-----

Развертывание проекта и настройка виртуального окружения
----------------------------------------

# Развертывание проекта

У нас на сервере будет нескольких сайтов, то нужно выделить отдельный каталог для каждого. Для простоты лучше называть каталог так-же как и сайт. Наш сайт будет называться c2g.cube2.ru, а значит пусть и папка будет иметь тоже имя. Создадим её и перейдем внутрь: 
```bash
mkdir -p $HOME/c2g.cube2.ru
cd $HOME/c2g.cube2.ru
```

Что бы развернуть проект c git-hub-а нам понадобится система контроля версий **git**. Установим её: 
```bash
sudo apt-get install git
```

Теперь мы можем просто скопировать проект из репозитория git в свою папку с помощью `git clone`: 
```bash
git clone https://github.com/erjemin/classifier-manager
```

# Настройка виртуального окружения проекта

Для того, чтобы наш проект мог использовать собственные библиоткеи python (в том числе и собственную версию Djagino) и не зависить от общих настроек Python на сервер, надо установить серверный пакет виртуального окружения **python-virtualenv**. В него, при необходимости, можно установить даже отдельную версию самого Python. 
```bash
sudo apt-get install python-virtualenv
```

Теперь развернем виртуальное окружение. Оно создаст каталог, в котором будут находится файлы виртуального окружение (версия Python, установщик пакетов pip, wheel, setuptools а также все ненобходимые нам пакеты, батейки, свистелки и хрюкалки нашего проекта).
```bash
virtualenv $HOME/c2g.cube2.ru/env
```

Для накатывания пакетов именно в виртуальное окружение его надо активировать и сделать его локальной (текущей) средой окружения. 
```bash
source $HOME/c2g.cube2.ru/env/bin/activate
```

Теперь все наши пакеты будут устанавливаться в виртуальное окружение и попадать в папку `$HOME/c2g.cube2.ru/env/bin/activate`. Уснавналиваем необходиму нам версию фреймфорка Django
```
pip install Django==1.9.10
```

Проверяем, что Django установилась правильно и нужной версии. Входим:
```
django-admin version
```

Если виртуальное окружение настроено правильно, и Django установлдено корректно, выведется строка с вывести текущей версией Django:
> 1.9.10

Продолжаем установку неодходимых модулей -- коннекторов mySQL и библиотеку транслитерации: 
```bash
pip install mysql-connector
pip install mysqlclient
pip install MySQL-python
pip install transliterate
```
Возможна ошибка по причине нехватки dev-модулей для сборки многопотоковых коннекторов. Устанавливаем их с помощью `sudo apt-get install python-dev libmysqlclient-dev` и повторяем предыдущую операцию.

Наш проект подготовлен. Можем созать миграцию, которая содаст все нобходимые таблицы в наше базе дынных. Но перед тем как ее выплнить нам надо испровить настроки нашего проекта `settings.py` и указать в ней настройки нашей базы данных:
```
nano $HOME//c2g.cube2.ru/classifier-manager/classifier/settings.py
```

Находим в ней сроки для настройки почты и меняем настроки `EMAIL_HOST`, `EMAIL_PORT`, `EMAIL_HOST_USER` и `EMAIL_HOST_PASSWORD` для работы почты:
```Python
EMAIL_HOST  = 'mail.server.ru'       # SMTP server
EMAIL_PORT  = 587
EMAIL_HOST_USER = '[user]@server.ru' # login if requared or ''
EMAIL_HOST_PASSWORD = 'password_to_mail'       # '' password
```
Аналогичные изменения вносим для настроек рабочих каталогов для файлов статики и базы данных. Для статики меняем параметры `STATIC_ROOT`, `STATIC_BASE_PATH` и `MEDIA_ROOT` указывая вместо `[user]` имя нашего пользователя. Для базы данных меняем параметры `'USER'` и `'PASSWORD'`:
```Python
if (socket.gethostname() == 'raspberrypi'):
    # НАЗНАЧЕНИЕ ДИРЕКТОРИЙ ДЛЯ ПРОДАКШН-СЕРВЕРА (RASPBERRY PI 3) ----
    STATIC_ROOT         = '/home/[user]/c2g.cube2.ru/classifier-manager/static'
    STATIC_BASE_PATH    = '/home/[user]/c2g.cube2.ru/classifier-manager/static'
    MEDIA_ROOT          = '/home/[user]/c2g.cube2.ru/classifier-manager/media'
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'HOST': 'localhost',   # Set to empty string for localhost. Not used with sqlite3.
            'PORT': '3306',              # Set to empty string for default. Not used with sqlite3.
            'NAME': 'django_classify',                  # Not used with sqlite3.
            'USER': '[user]',                      # Not used with sqlite3.
            'PASSWORD': 'secret_password_mysql_user',                  # Not used with sqlite3.
            'OPTIONS': { 'autocommit': True, }
        }
    }
```

Сохраняем файл `Ctrl+O` и `Enter`, а затем выходим из редактора `Ctrl+X`. Переходим в папку проета:
```bash
cd ~/c2g.cube2.ru/classifier-manager
```
и выполнчем миграцию:
```bash
python manage.py migrate
```

Django сообщит нам о создании всех неоходимых таблиц. Теперь можем проверить хорошо ли у нас с безопасностью:
```bash
python manage.py check --deploy
```
Django сообщит какие настройки в `settings.py` нам еще необходимя для ее повышения. Собщение:
> ?: (security.W001) You do not have 'django.middleware.security.SecurityMiddleware' in your MIDDLEWARE_CLASSES so the SECURE_HSTS_SECONDS, SECURE_CONTENT_TYPE_NOSNIFF, SECURE_BROWSER_XSS_FILTER, and SECURE_SSL_REDIRECT settings will have no effect.

Можем проигнорировать, так как доступа по http (SSL) наш проект поддерживать не планирует.

Теперь создаем суперпользователя Django. С его помощью мы сможем входить в административную пнаель Django:
```
python manage.py createsuperuser
```
Нам предложат указать логин администратора Django, его email и праоль доступа. Пароль должен быть не менее фосьми символов:
```
It must contain at least 8 characters.

Username (leave blank to use 'user'): [user]
Email address: [user]@mail.me
Password:
Password (again):
Superuser created successfully.
```

Теперь надо создать каталоги `media` и `static/js`, т.к. они для проекта нужны, а в дипозитории git их нет и они не были созданы при клонировании. 
```bash
mkdir -p $HOME/c2g.cube2.ru/classifier-manager/static/js
mkdir -p $HOME/c2g.cube2.ru/classifier-manager/media
```

Теперь перенесем статический файлы панели администратора: 
```
python manage.py collectstatic
```
Получим сообщение о переносе файлов:
>
> You have requested to collect static files at the destination
> location as specified in your settings:
>
>    /home/[user]/c2g.cube2.ru/classifier-manager/static
>
> This will overwrite existing files!
> Are you sure you want to do this?
> 
> Type 'yes' to continue, or 'no' to cancel: yes
> Copying '/home/user/c2g.cube2.ru/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/fonts/Roboto-Light-webfont.woff'
> Copying '/home/user/c2g.cube2.ru/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/fonts/LICENSE.txt'
> ...
> ...
> ...
> Copying '/home/user/c2g.cube2.ru/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/img/gis/move_vertex_on.svg'
> Copying '/home/user/c2g.cube2.ru/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/img/gis/move_vertex_off.svg'
> 
>57 static files copied to '/home/eserg/c2g.cube2.ru/classifier-manager/static', 8 unmodified.

Все! Проект развернут, настроен и готов к тестовому запуску с помощбю встроенного в Django веб-сервра:
```
python manage.py runserver [ip-адрес нашего Raspberry pi]:7000
```

Теперь набрав в браузере `http://[ip-адрес нашего Raspberry pi]:7000` мы должны увидеть, что проект работает.

Надо учесть, что раздача статических файлов Django-сервером для разработки при работе на внешний адрес не предусмотрено. То есть статические файлы, CSS файлы, JavaScript, изображения и другие файлы по адресу MEDIA_URL и STATIC_URL не будут доступны. Нам это и не надо, так как наша цель настроить боевой веб-сервер, а не тестовый сервер разработчика. Запуск тестового веб-сервера нужна исключительно чтобы убедитьтся чт наш проект настроен корректно и Python-скрипты Django работают.

Если интересно, то узнать как настроить раздачу файлов можно узнать из раздела Django-документации: [Работа со статическими файлами (CSS, изображения)](http://djbook.ru/rel1.8/howto/static-files/index.html).

Завершаем работу тестового веб-сервера Django нажатием `Ctrl-C`

Теперь мы можем перейти к настройки боевого веб-сервера. Но пере этим нам нужно покнуть виртуальное окружение, в котором мы настроили наш проект и тестировали. Деактивация виртуального окружения производится командой `deactivate`:
```bash
deactivate
```
Теперь мы будем работать с системными библиотеками.

-------

Установка веб-вервера nginx.
-------------------------------

На сервре могжет быть уже установлен другой web-сервер -- **Apache**. Придется его удалить самым радикальным способом.

# Удаляем веб-сервер apache

Сначала удаляем все его компоненты:
```bash
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
```

Затем чистим неиспользуемые («подвисшие») зависимые пакеты, которые не удалилось деинсталировать с помощью предыдущей команды:
```bash
sudo apt-get autoremove
```

Ищем файлы, который остались от Apache2 (папки, которые не удалились, файлы и т.д.):
```bash
whereis apache2
```

Получаем список директорий (чаще всего одну `/etc/apache2`, в которой могли остаться конфигурационные файлы), смотрим их содержимое, и если ничего важного в ни нет, то удаляем командой:
```bash
sudo rm -rf /etc/apache2
```

Все. Мы полностью избавились от Apache2 и теперь можно обновить репозиторий. Это особенно важно если разворачиваем на новой машинке или свежей VPS, где он полностью пустой:
```bash
sudo apt-get update
```

# Устанокв веб-сервера nginx

```bash
sudo art-get install nginx
```

К сожалению, в репозиториях Debian для Raspbery pi лежат не самые свежие пакеты. Иногда они реально очень старые, и если нас это не устраивает, то можно поверх уже установленной версии <накатить> версию из исходников. Сначала устанавливаем пакеты, необходимые для сборки nginx из исходников (компилятор С++, библиотеки и все такое):
```bash
sudo apt-get install gcc
sudo apt-get install build-essential 
sudo apt-get install libpcre3-dev 
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libexpat1-dev
```

Смотрим [на сайте nginx] (http://nginx.org/ru/download.html) акутальную стабильную версию, скачиваем ее в домашнюю директорию и расспаковываем исходники. Переходим в папку, в которую все распокавалось. В ней будем собирать пакет:
```bash
cd $HOME
wget http://nginx.org/download/nginx-1.10.1.tar.gz 
tar -zxvf nginx-1.10.1.tar.gz 
cd nginx-1.10.1
```

Командой `nano conf.sh` создаем командный файл: 
```bash
./configure --sbin-path=/usr/local/sbin \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--user=www-data \
--group=www-data \
--with-http_gzip_static_module \
--with-http_realip_module \
--with-http_mp4_module \
--with-http_flv_module \
--with-http_dav_module \
--with-http_secure_link_module \
```
Сохраняем файл `Ctrl+O` и `Enter`, а затем выходим из редактора `Ctrl+X`. 

В этот же файл можно добавить дополнительные модуди, если мы хотим сборку с ними. Например, на такой маленькой машинке как Sapberry pi пригодился бы модуль поддержки WebDAV `--add-module=/root/nginx/nginx-webdav-ext/` (естественно, его перед сборкой тоже надо будет скачать). Но для конкретного проекта в этом нет необходимости. 

Для того чтобы командный `conf.sh` файл  можно было запустить устанавливаем соответсвующие права, а за тем запускаем его: 
```bash
chmod +rwx conf.sh
sudo bash conf.sh
```

Если все прошло хорошо, то можно приступать с компиляции, и установить то что получится.
```bash
sudo make
sudo make install
```

nginx установлен. Если же поле `make` ругается на недостаток каких-то модулей в Linux, то придется разобраться, установить необходимое. Если же все прошло гладко, то нужно проверить, что веб-сервер запускается:
```bash
sudo service nginx start
```
Убедиться что nginx работает корректно можно набрав _арес.нашего.серера_ или его _ip_ в браузере. Должна отображаться страница: ***`Welcome to nginx on Debian!`***

Установка с помощью `sudo art-get install nginx` уже произвела все необходимые настроки автозапуска. Убедиться что они работают можно перегркзив компьютер:
```bash
sudo reboot
```

Убеждаемся, что nginx запущен, снова набрав _арес.нашего.серера_ или его _ip_ в браузере. Если мы устанавливали версию из исходников, то убедиться, что работает имено она можно набрав команду:
```bash
nginx -v
```
Получим сообщение:
> nginx version: nginx/1.10.1

Место на нашем Raspbery pi не резиновое, и теперь можем благополучно удалить папку в которой происходила сборка nginx и архив с исходниками:
```bash
rm -R $HOME/nginx-1.10.1
rm $HOME/nginx-1.10.1.tar.gz
```







# настройка Uwsgi

Для того чтобы можно было установить uwsgi (а может и еще для чего нибудь) нужно установить пакет **python-dev**
```bash
sudo apt-get install python-dev 
```





В состав Django входит простенький веб-сервер, который позволяет сразу просмотреть работу сайта в процессе разработки, но для работы на хостинге нужно более серьезное решение. В нашем случае -- nginx. В нем (а впрочем и в други веб-серверах) обмен данными с python-приложений происходит через WSGI (Web Server Gateway Interface). В его основе лежат сокеты (нечто вроде общего блока памяти к которому может обращаться и веб-сервер и приложение) через которые пробрасыватся данные мкжду приложением и сервером. 

Существуем множество сервисов WSGI -- gunicorn, passenger_wsgi, flup, FastCGI (вот [далеко не полный список WSGI] (http://wsgi.readthedocs.io/en/latest/servers.html) -- и для нашего сервера мы выберем uWSGI. Он достаточно компактен, шустрый и не прожорливый. Для миниатюрного Paspbery pi -- самое то. Установим uWSGI на системном уровне, чтобы и другие Python-сайты моги его сипользовать:

```bash
sudo pip install uwsgi
```

Теперь надо настроить наш сайта в nginx. Создаем каталоги для хранения логов, конфигурационных файлов и сокета. 
```bash
mkdir -p $HOME/c2g.cube2.ru/logs
mkdir -p $HOME/c2g.cube2.ru/conf
mkdir -p $HOME/c2g.cube2.ru/sock
```

Создаём конфигурационный файл c2g.cube2.ru_nginx.conf:
```bash
nano $HOME/c2g.cube2.ru/c2g_cube2_ru_nginx.conf
```
Со следующим содержанием:
```conf
#       ___  ___   ___    ___  __  __  ____  ____  ___     ____  __  __ 
#      / __)(__ \ / __)  / __)(  )(  )(  _ \( ___)(__ \   (  _ \(  )(  )
#     ( (__  / _/( (_-. ( (__  )(__)(  ) _ < )__)  / _/    )   / )(__)( 
#      \___)(____)\___/()\___)(______)(____/(____)(____)()(_)\_)(______)
# Конфикурационный файл nginx для сайта c2g.cube2.ru (c2g.cube2.ru_nginx.conf)

# не забываем изменять _user_ на имя нашего пользователя, которому будет разрешено деплоить и перезапускать сайт.

# Описываем апстрим-потоки которые должен подключить Nginx 
# Для каждого сайта надо настроить свйо поток, со своим уникальным именем.
# Если будете настраивать несколько pythjy (django) сайтов - измените название upstream

upstream c2g_cube2_ru_django {
    # расположение файла Unix-сокет для взаимодействие с uwsgi
    server: unix:///home/_user_/c2g.cube2.ru/sock/c2g_cube2_ru.sock;  
    # также можно использовать веб-сокет (порт) для взаимодействие с uwsgi. Но это медленнее
    # server 127.0.0.1:8001; # для взаимодействия с uwsgi через веб-порт
}

# конфигурируем сервер
server {
    listen      80;           # порт на котором будет доступен наш сайт
    server_name c2g.cube2.ru; # доменное имя сайта
    charset     utf-8;        # подировка по умолчанию
    access_log  /home/_user_/c2g.cube2.ru/logs/c2g_cube2_ru_access.log; # логи с доступом
    error_log   /home/_user_/c2g.cube2.ru/logs/c2g_cube2_ru_error.log; # логи с ошибками
    client_max_body_size 32M; # максимальный объем файла для загрузки на сайт (max upload size)

    # Расположение media-файлов Django
    location /media  {
        alias /home/_user_/c2g.cube2.ru/classifier-manager/media;  
        }
    # Расположение static-файлов Django
    location /static {
        alias /home/_user_/c2g.cube2.ru/classifier-manager/static; 
        }
    
    # Остальные запросы перенаправляются в Django приложение
    location / {
        uwsgi_pass  c2g_cube2_ru_django;
        include     uwsgi_params;       # конфигурационный файл uwsgi;
        }
    }
```  
Проверьте ве скуобочки и точки с запятой... Они могут создать много неприятностей. Сохраняем файл `Ctrl+O` и `Enter`, а затем выходим из редактора `Ctrl+X`.

Эта конфигурация сообщает nginx, каким образом он отдвет данные при обращении к _c2g.cube2.ru_ по порту _80_. Так, при обащении статическим и загруженным пользователем файлам, он отдает их из соответсвующих каталогов, а остальные  запросы перенаправляются в Django приложение через апстрим _c2g_cube2_ru_django_, который работает через юникосвкий файл-сокет _/home/_user_/c2g.cube2.ru/sock/abc_cube2_ru_uwsgi.sock_.

По умолчанию файл конфигурации uwsgi нажодится в папке _/etc/nginx/uwsgi_params_ и мы спользуем именно его, но при желании мы может переопределить eго. Кслову сказать, в ранних версиях nginx файл _uwsgi_params_ в поставку не входил. Проверьте естьли он у вас, и при необходимости загрузите с сайта https://github.com/nginx/nginx/blob/master/conf/uwsgi_params

Чтобы nginx подключил наш новый файл конфигурации сайьа нужно добавьте ссылку на него в каталог /etc/nginx/sites-enabled/
```bash
sudo ln -s $HOME/c2g.cube2.ru/c2g_cube2_ru_nginx.conf /etc/nginx/sites-enabled/
```

Теперь нужно перезагрузить nginx
```bash
sudo service nginx restart
```

В результате статические файлы теперь будут отдаваться в браузер. Так вызвав `http://c2g.cube2.ru/static/img/cubex.png` получим картинку:
![Что показываю по http://c2g.cube2.ru/static/img/cubex.png](https://raw.githubusercontent.com/erjemin/classifier-manager/master/static/img/cubex.png "cubex.png")

nginx работает. То что все в нем корректно проверяем командой: `systemctl status nginx.service`

```
● nginx.service - A high performance web server and a reverse proxy server
   Loaded: loaded (/lib/systemd/system/nginx.service; enabled)
   Active: active (running) since Вс 2016-10-16 01:04:21 MSK; 5min ago
  Process: 26642 ExecStop=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid (code=exited, status=0/SUCCESS)
  Process: 26648 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
  Process: 26645 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
 Main PID: 26650 (nginx)
   CGroup: /system.slice/nginx.service
           ├─26650 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
           ├─26651 nginx: worker process
           ├─26652 nginx: worker process
           ├─26653 nginx: worker process
           └─26654 nginx: worker process
```

Теперь создаем файл конфигурации uwsgi для нашего проекта. В нем буду описано какое виртуальное окружение использует проект.
```bash
nano /home/eserg/c2g.cube2.ru/conf/c2g_cube2_ru_uwsgi.ini
```
Сожержание этого файла будет примерно таким
```bash
# c2g_cube2_ru_uwsgi.ini -- настройки uWSGI для c2g.cube2.ru
[uwsgi]

# НАСТРОЙКИ ДЛЯ DJANGO
# Корневая папка проекта (полный путь)
chdir           = /home/eserg/c2g.cube2.ru/classifier-manager
# Django wsgi файл
module          = classifier.wsgi
# полный путь к виртуальному окружению
home            = /home/eserg/c2g.cube2.ru/env
# полный путь к файлу сокета
socket          = /home/eserg/c2g.cube2.ru/sock/c2g_cube2_ru.sock
# Исходящие сообщения в лог
daemonize       = /home/eserg/c2g.cube2.ru/logs/c2g_cube2_ru_uwsqi.log


# общие настройки
# быть master-процессом
master          = true
# максимальное количество процессов
processes       = 4
# права доступа к файлу сокета
chmod-socket    = 666
# chown-socket  =  ???
# очищать окружение от служебных файлов uwsgi по завершению
vacuum          = true
# количество секунд после которых подвисший процес будет перезапущен
# harakiri        = 30
# WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers

enable-threads = true
vacuum = true
thunder-lock = true
max-requests = 5000

uid             = www-data
gid             = www-data

```

Запускаем uwsgi с нашим конфигом:
```bash
uwsgi --ini /home/eserg/c2g.cube2.ru/conf/c2g_cube2_ru_uwsgi.ini
```

Если ничего не заработало, то проверяем файл и смотрим Log `/home/[user]/c2g.cube2.ru/logs/c2g_cube2_ru_error.log`. Виды ошибок:
Первая:
```
2016/10/16 01:05:45 [crit] 26651#0: *2 connect() to unix:///home/[user]/c2g.cube2.ru/sock/c2g_cube2_ru.sock failed (13: Permission denied) while connecting to upstream, client: 192.168.1.1, server: c2g.cube2.ru, request: "GET / HTTP/1.1", upstream: "uwsgi://unix:///home/eserg/c2g.cube2.ru/sock/c2g_cube2_ru.sock:", host: "c2g.cube2.ru"
```
Означает, что не хватает прав на доступ с сокетом. По идее в нашем `c2g_cube2_ru_uwsgi.ini` должно хватать `chmod-socket = 664`, но непонтяно почему не хватает. Меняем на `chmod-socket = 666`. 

Вторая:
````
2016/10/16 01:36:34 [error] 26844#0: *7 upstream prematurely closed connection while reading response header from upstream, client: 192.168.1.1, server: c2g.cube2.ru, request: "GET / HTTP/1.1", upstream: "uwsgi://unix:///home/eserg/c2g.cube2.ru/sock/c2g_cube2_ru.sock:", host: "c2g.cube2.ru"
````

```bash
cat /home/eserg/c2g.cube2.ru/logs/c2g_cube2_ru_uwsqi.log
```

В нем отображаются все сообщения инициализации uwsgi. Внизу находятся самые свежие записи. Запись начинается со строки: `*** Starting uWSGI`. Нас могут беспокоить : `!!! no internal routing support, rebuild with pcre support !!!` -- Значит у нас устанвлен однопоточный uwsg при многопоточном nginx и процессорею. Можно устанвить `enable-threads = false`, но лучше собрать многопоточный uwsgi с pcre:
```
deactivate
sudo apt-get install libpcre3 libpcre3-dev
sudo pip uninstall uwsgi
sudo apt-get purge uwsgi
sudo pip install uwsgi -I
```

В конце выдаст:
```
    ################# uWSGI configuration #################
    
    pcre = True
    kernel = Linux
    malloc = libc
    execinfo = False
    ifaddrs = True
    ssl = False
    zlib = True
    locking = pthread_mutex
    plugin_dir = .
    timer = timerfd
    yaml = embedded
    json = False
    filemonitor = inotify
    routing = True
    debug = False
    ucontext = False
    capabilities = False
    xml = expat
    event = epoll
    
    ############## end of uWSGI configuration #############
    ```
   
Как видим `pcre = True`, значит все установилось правильно.

Запускаем uwsgi с нашим конфигом:
```bash
uwsgi --ini /home/eserg/c2g.cube2.ru/conf/c2g_cube2_ru_uwsgi.ini
```
Открываем сайт. И если он открывается с ошибкой 502, то смотрим 



# Emperor-режим uwsgi

Если сервер обслуживает несколько проектов, каждый из которых использует uWSGI, то нужно исползовать режим Emperor. В этом режиме uWSGI просматривает папку с конфигурационными файлами и для каждого файла запускает отдельный процесс (вассал).

Если один из конфигурационных файлов будет изменен, uWSGI перезапустит соответствующего вассала.

Создаем папку для конфигурационных файлов:
sudo mkdir /etc/uwsgi
sudo mkdir /etc/uwsgi/vassals

Создаем в ней ссылку на mysite_uwsgi.ini:
sudo ln -s /path/to/your/mysite/mysite_uwsgi.ini /etc/uwsgi/vassals/

Запускаем uWSGI в режиме Emperor:
sudo uwsgi --emperor /etc/uwsgi/vassals --uid www-data --gid www-data

Опции:
emperor: папка с конфигурациолнными файлами
uid: id пользователя, от имени которого будет запущен процесс
gid: id группы, от имени которой будет запущен процесс




------
Данная микросистема управление деревьями работает во внутренних интерфейсах [Торгово-логистического портала **CargоToGo**] (http://cargotogo.com) и [Маркет-плейс агрегатора окон **«Окнардия»**] (http://oknardia.ru). Надеюсь, что проделанная работа пригодится и вам. Успехов!


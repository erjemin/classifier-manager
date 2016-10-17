Как развертывать под Linux
==============================

В моем случае под Debian GNU/Linux установленом на Raspberry pi 3.
Развертывание под другие разновидности Debian (Ubuntu, Runtu, gNewSense и пр.) не должно отличаться.

Установка пакетов до виртуального окружения
-------------------------

# Устанавливаем веб-вервер nginx.

На сервре могжет быть уже установлен другой web-сервер -- **Apache**. Придется его удалить самым радикальным способом. Сначала удаляем все его компоненты:
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

Теперь можем приступить к установке **nginx**:

```bash
sudo art-get install nginx
```
К сожалению, в репозиториях Debian для Raspbery pi лежат не самые свежие пакеты. Иногда они реально очень староые, и если нас это не устраивает, то можно поверх уже установленной версии <накатить> версию из исходников. Сначала устанавливаем пакеты, необходимые для сборки nginx из исходников (компилятор С++, библиотеки и все такое):
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

В этот же файл можно добавить дополнительные модуди, если мы хотим сорку с ними. Например, на такой маленькой машинке как Sapberry pi пригодился бы модуль поддержки WebDAV `--add-module=/root/nginx/nginx-webdav-ext/` (естественно, его перед сборкой тоже надо будет скачать). Но для конкретного проекта в этом нет необходимости. 

Для того чтобы командный `conf.sh` файл  можно было запустить устанавливаем соответсвующие права, а за тем запускаем. 
```bash
chmod +rwx conf.sh
sudo bash conf.sh
```

Если все прошло хорошо, то можно приступать с компиляции, и установить то что получится.
```bash
sudo make
sudo make install
```

nginx установлен. Если же поле `make` ругается на недостаток каких-то модулей в Linux, то придется разобраться, установить необходимое. Если же все прошло гладко, то нужно проверить, что запускается:
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

# Подготавливаем каталог проекта и разворачиваем Django для работы

`sudo usermod -g www-data eserg`

Что бы развернуть проект c git-hub-а нам понадобится **git**. Для того, чтобы наш проект мог использовать собственные библиоткеи python (в том числе и собственную версию Djagino) и не зависить от общих настроек Python надо установить серверный пакет виртуального окружения **python-virtualenv**. В него, при необходимости, можно установить даже отдельную версию самого Python. Для того чтобы можно было установить uwsgi (а может и еще для чего нибудь) нужно установить пакет **python-dev**
```bash
sudo apt-get install git
sudo apt-get install python-virtualenv
sudo apt-get install python-dev 
```

В состав Django входит простенький веб-сервер, который позволяет сразу просмотреть работу сайта в процессе разработки, но для работы на хостинге нужно более серьезное решение. В нашем случае -- nginx. В нем (а впрочем и в други веб-серверах) обмен данными с python-приложений происходит через WSGI (Web Server Gateway Interface). В его основе лежат сокеты (нечто вроде общего блока памяти к которому может обращаться и веб-сервер и приложение) через которые пробрасыватся данные мкжду приложением и сервером. 

Существуем множество сервисов WSGI -- gunicorn, passenger_wsgi, flup, FastCGI (вот [далеко не полный список WSGI] (http://wsgi.readthedocs.io/en/latest/servers.html) -- и для нашего сервера мы выберем uWSGI. Он достаточно компактен, шустрый и не прожорливый. Для миниатюрного Paspbery pi -- самое то. Установим uWSGI на системном уровне, чтобы и другие Python-сайты моги его сипользовать:

```bash
sudo pip install uwsgi
```

У нас на сервере будет нескольких сайтов, то нужно выделить отдельный каталог для каждого. Для простоты лучше называть каталог так-же как и сайт. Наш сайт будет называться c2g.cube2.ru, а значит пусть и папка будет иметь тоже имя: 
```bash
mkdir -p $HOME/c2g.cube2.ru
cd $HOME/c2g.cube2.ru
```

Так как наш проект находится в системе контроля версий GIT на github, то идеальный вариант для того чтобы скопировать его в свою папку -- выполнить `git clone`: 
```bash
git clone https://github.com/erjemin/classifier-manager
```

Теперь развернем виртуальное окружение. Оно создаст каталог, в котором будут находится файлы виртуального окружение (версия Python, установщик пакетов pip, wheel, setuptools а в будущем и все ненобходимые нам пакеты, батейки, свистелки и хрукалки нашего проекта).
```bash
virtualenv $HOME/c2g.cube2.ru/env
```

Для накатывания пакетов именно в виртуальное окружение его надо активировать и сделать локальной (текущей) средой окружения. После этого они будут конфликтовать с системными версиями. Чтобы деактивировать виртуальное окружения и работать с системными библиотеками, выполните команду `deactivate`:
```bash
source $HOME/c2g.cube2.ru/env/bin/activate
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


# uid             = www-data
# gid             = www-data

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

```
sudo apt-get install mysql-server
mysql -u root -p
CREATE DATABASE django_classify DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON django_classify.* TO 'user'@'%' IDENTIFIED BY 'secret_password' WITH GRANT OPTION;
```
пароль

```
source $HOME/c2g.cube2.ru/env/bin/activate
pip install Django==1.9.10
```
Проверяем, что Django установилась правильно. Входим:
```
django-admin version
```
Если виртуальное окружение настроено правильно, и Django установлдено корректно, выведктся строка с вывести текущей версией Django:
```
1.9.10
```
продолжаем установку неодходимых модулей.

pip install mysql-connector
sudo apt-get install python-dev libmysqlclient-dev
pip install mysqlclient
pip install MySQL-python
pip install transliterate

cd ~/c2g.cube2.ru/classifier-manager
python manage.py migrate --fake-initial

python manage.py check --deploy
    ?: (security.W001) You do not have 'django.middleware.security.SecurityMiddleware' in your MIDDLEWARE_CLASSES so the SECURE_HSTS_SECONDS, SECURE_CONTENT_TYPE_NOSNIFF, SECURE_BROWSER_XSS_FILTER, and SECURE_SSL_REDIRECT settings will have no effect.


```
python manage.py createsuperuser
```
It must contain at least 8 characters.
```
Username (leave blank to use 'user'): user
Email address: user@mail.me
Password: 
Password (again): 
Superuser created successfully.
```






python manage.py runserver 192.168.1.111:7000




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


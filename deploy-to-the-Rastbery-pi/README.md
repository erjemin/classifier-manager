Развертывание системы управления деревом классификатора: Raspberry pi, Raspberian linux (Debifn), витуальное окружение, Python и Django, nginx, uWSGI
==============================

В моем случае я разворачиваю проект под Raspberry pi 3 под операционной системой Raspberian, которая представляет из себя разновидность Debian GNU/Linux 8 (jessie) собранной спецтально под Raspberry pi. Развертывание под другие разновидности Debian (Ubuntu, Runtu, gNewSense и пр.) не должно отличаться.

На нашем микросервере Raspberry pi уже есть супер пользователь по умолчанию -- **pi**. У него есть доступ по SSH. Но в силу того, что такой пользователь есть на всех Raspberry pi, то для безопасности лучше закрыть ему SSH-доступ, создать нового пользователя и выполнять команды и запускать нужные нам сервисы от его имени. Наш пользователь будет называться **[user]**, замените его на своего.

**!!!КСТАТИ, ВАЖНО: ВСЕ ЗНАЧЕНИЯ ПОМЕЩЕННЫЕ В КВАДРАТНЫЕ СКОБКИ НАДО ЗАМЕНИТЬ НА СВОИ СОБСТВЕННЫЕ. ЭТО КАСАЕТСЯ ИМЕНИ [user], ПАРОЛЕЙ [password], [адрес сайта] И ВСЕГО ТАКОГО ПРОЧЕНО. В ОБЩЕМ, ВЫ МЕНЯ ПОНЯЛИ!!!** 

# Создание пользователя и SSH-доступа

Первым делом нам понадобтся настроить пользователя, от имени которого мы будем работать и SSH-доступ для него.

Наше пользователя надо включить в группу `www-data`, которую будет использовать web-сервер:
`sudo usermod  [user] -g www-data`
sudo usermod  eserg -g adm

groups  [user]




Во-вторых, нам монадобится сервер базы данных МySQL. Устанавим его:

-----

# Установка и настройка сервера MySQL

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

# Развертывание проекта и настройка виртуального окружения

Развертывание системы управления деревом классификатора
-------------------------------------------------------

У нас на сервере будет нескольких сайтов, то нужно выделить отдельный каталог для каждого. Для простоты лучше называть каталог так-же как и сайт. Наш сайт будет называться **[адрес сайта]**, а значит пусть и папка будет иметь тоже имя. Создадим её и перейдем внутрь: 
```bash
mkdir -p $HOME/[адрес сайта]
cd $HOME/[адрес сайта]
```

Что бы развернуть проект c git-hub-а нам понадобится система контроля версий **git**. Установим её: 
```bash
sudo apt-get install git
```

Теперь мы можем просто скопировать проект из репозитория git в свою папку с помощью `git clone`: 
```bash
git clone https://github.com/erjemin/classifier-manager
```

Настройка виртуального окружения проекта
----------------------------------------

Для того, чтобы наш проект мог использовать собственные библиоткеи python (в том числе и собственную версию Djagino) и не зависить от общих настроек Python на сервер, надо установить серверный пакет виртуального окружения **python-virtualenv**. В него, при необходимости, можно установить даже отдельную версию самого Python. 
```bash
sudo apt-get install python-virtualenv
```

Теперь развернем виртуальное окружение. Оно создаст каталог, в котором будут находится файлы виртуального окружение (версия Python, установщик пакетов pip, wheel, setuptools а также все ненобходимые нам пакеты, батейки, свистелки и хрюкалки нашего проекта).
```bash
virtualenv $HOME/[адрес сайта]/env
```

Для накатывания пакетов именно в виртуальное окружение его надо активировать и сделать его локальной (текущей) средой окружения. 
```bash
source $HOME/[адрес сайта]/env/bin/activate
```

Теперь все наши пакеты будут устанавливаться в виртуальное окружение и попадать в папку `$HOME/[адрес сайта]/env/bin/activate`. Уснавналиваем необходиму нам версию фреймфорка Django
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
nano $HOME/[адрес сайта]/classifier-manager/classifier/settings.py
```

Находим в ней сроки для настройки почты и меняем настроки `EMAIL_HOST`, `EMAIL_PORT`, `EMAIL_HOST_USER` и `EMAIL_HOST_PASSWORD` для работы почты:
```Python
EMAIL_HOST  = 'mail.server.ru'                 # хост почтового SMTP-сервреа
EMAIL_PORT  = 587                              # порт  почтового SMTP-сервреа
EMAIL_HOST_USER = '[user]@server.ru'           # логин (email) для входа на постовый сервер
EMAIL_HOST_PASSWORD = 'password_to_mail'       # пароль для входа на постовый серве
```
Аналогичные изменения вносим для настроек рабочих каталогов для файлов статики и базы данных. Для статики меняем параметры `STATIC_ROOT`, `STATIC_BASE_PATH` и `MEDIA_ROOT` указывая вместо **`[user]`** имя нашего пользователя, а вместо **`[адрес сайта]`** имя папки, которая, как иы договорились ранее, совпадаем с адресом сайта. Для базы данных меняем параметры `'USER'` и `'PASSWORD'`:
```Python
if (socket.gethostname() == 'raspberrypi'):
    # НАЗНАЧЕНИЕ ДИРЕКТОРИЙ ДЛЯ ПРОДАКШН-СЕРВЕРА (RASPBERRY PI 3) ----
    STATIC_ROOT         = '/home/[user]/[адрес сайта]/classifier-manager/static'
    STATIC_BASE_PATH    = '/home/[user]/[адрес сайта]/classifier-manager/static'
    MEDIA_ROOT          = '/home/[user]/[адрес сайта]/classifier-manager/media'
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'HOST': 'localhost',                         # хост для соедиения с базой данных
            'PORT': '3306',                              # порт для соединения с базой данных
            'NAME': 'django_classify',                   # имя базы данных
            'USER': '[user]',                            # пользователь базы жанных 
            'PASSWORD': 'secret_password_mysql_user',    # пароль пользователя базы данных
            'OPTIONS': { 'autocommit': True, }
        }
    }
```

Сохраняем файл `Ctrl+O` и `Enter`, а затем выходим из редактора `Ctrl+X`. Переходим в папку проета:
```bash
cd ~/[адрес сайта]/classifier-manager
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

Можем проигнорировать, так как доступа по https-протоколу (с SSL-шифрованием) наш проект поддерживать не планирует.

Теперь создаём суперпользователя Django. С его помощью мы сможем входить в административную пнаель Django:
```bash
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

Теперь надо создать каталоги `media` и `static/js`, т.к. для проекта они нужны, а в дипозитории git их нет, а значит они и не были созданы при клонировании. 
```bash
mkdir -p $HOME/[адрес сайта]/classifier-manager/static/js
mkdir -p $HOME/[адрес сайта]/classifier-manager/media
```

Теперь перенесем статические файлы панели администратора из каталогов виртуального окружения в папки статических файлов нашего сайта : 
```
python manage.py collectstatic
```
Получим сообщения о переносе файлов:
```
You have requested to collect static files at the destination
location as specified in your settings:

/home/[user]/[адрес сайта]/classifier-manager/static

This will overwrite existing files!
Are you sure you want to do this?

Type 'yes' to continue, or 'no' to cancel: yes
Copying '/home/[user]/[адрес сайта]/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/fonts/Roboto-Light-webfont.woff'
Copying '/home/[user]/[адрес сайта]/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/fonts/LICENSE.txt'
...
...
...
Copying '/home/[user]/[адрес сайта]/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/img/gis/move_vertex_on.svg'
Copying '/home/[user]/[адрес сайта]/env/local/lib/python2.7/site-packages/django/contrib/admin/static/admin/img/gis/move_vertex_off.svg'
 
57 static files copied to '/home/[user]/[адрес сайта]/classifier-manager/static', 8 unmodified.
```

Все! Проект развернут, настроен и готов к тестовому запуску с помощью встроенного в Django веб-сервра:
```bash
python manage.py runserver [адрес сайта]:7000
```

Теперь набрав в браузере `http://[адрес сайта]:7000` мы должны увидеть, что проект работает.

Надо учесть, что раздача статических файлов Django-сервером для разработки при работе на внешний адрес не предусмотрено. То есть статические файлы, CSS файлы, JavaScript, изображения и другие файлы по адресу MEDIA_URL и STATIC_URL не будут доступны. Нам это и не надо, так как наша цель настроить боевой веб-сервер, а не тестовый сервер разработчика. Запуск тестового веб-сервера нужна исключительно чтобы убедитьтся чт наш проект настроен корректно и Python-скрипты Django работают.

Если интересно, то узнать как настроить раздачу файлов можно узнать из раздела Django-документации: [Работа со статическими файлами (CSS, изображения)](http://djbook.ru/rel1.8/howto/static-files/index.html).

Завершаем работу тестового веб-сервера Django нажатием `Ctrl-C`

Теперь мы можем перейти к настройки боевого веб-сервера. Но пере этим нам нужно покнуть виртуальное окружение, в котором мы настроили наш проект и тестировали. Деактивация виртуального окружения производится командой `deactivate`. Теперь мы будем работать с системными библиотеками:
```bash
deactivate
```
-------

# Установка веб-вервера nginx.

На сервре могжет быть уже установлен другой web-сервер -- **Apache**. Придется его удалить самым радикальным способом.

Удаляем веб-сервер apache
-------------------------
Сначала удаляем все его компоненты:
```bash
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
```

Затем чистим неиспользуемые («подвисшие») зависимые пакеты, которые не удалилось деинсталировать с помощью предыдущей команды:
```bash
sudo apt-get autoremove
```

Ищем файлы, который остались от Apache2 (папки, которые не удалились, файлы конфигураций и т.д.):
```bash
whereis apache2
```

Получаем список директорий (чаще всего одну `/etc/apache2`, в которой могли остаться конфигурационные файлы), смотрим их содержимое. E если ничего важного в ни[ нет, то удаляем командой:
```bash
sudo rm -rf /etc/apache2
```

Все. Мы избавились от Apache2.

Установка и настройка веб-сервера nginx
---------------------------------------

### подготовка к установке nginx

В репозитрии Debian для Raspberry есть nginx, но на всякий случай мы подключим дополнительный репозиторий самого nginx. Это позволит нам получать обновления немного ранбше чем они попадут в репозиторий Respberryan. Для проверки подлинности подписи репозитория nginx, и чтобы избавиться от предупреждений об отсутствующем PGP-ключе во время установки пакета, необходимо добавить ключ, которым были подписаны пакеты и репозиторий nginx, в связку ключей программы apt. Загружаем этот ключ в корень домашней папки:
```bash
cd $HOME
wget http://nginx.org/keys/nginx_signing.key
```

И добавим этот ключ в связку ключей наших репозиторив:
```bash
sudo apt-key add nginx_signing.key
```
После добавим имя дистрибутива в файле со списком репозиториев `/etc/apt/sources.list`. Открываем список наректирование:
```bash
sudo nano /etc/apt/sources.list
```
Для системы под Ratpberry pi под Debian Linux (Raspberryan) в конец файла надо добавить:
```
deb http://nginx.org/packages/debian/ jessie nginx
deb-src http://nginx.org/packages/debian/ jessie nginx
```
Для других систем (Ubuntu/SLES/RHEL/CentOS) вместо ***jessie*** надо указать соотвествующие имя дистрибутива. Кодовые имена дистрибутива можно указать [на страничке описаний пакетов nginx](http://nginx.org/ru/linux_packages.html#distributions).

Сохраняем файл `Ctrl+O` и `Enter`, а затем выходим из редактора nano `Ctrl+X`. Теперь можно обновить репозиторий. Это особенно важно если разворачиваем на новой машинке или свежей VPS, где он полностью пустой:
```bash
sudo apt-get update
```

Удаляем PGP-ключ из корня домашней папки:
```bash
rm $HOME/nginx_signing.key
```

### Установка nginx

В состав Django входит простенький веб-сервер, на котром мы испытали установку окружения и развертывание Django-приложения. Он позволяет сразу просмотреть работу сайта в процессе разработки, но для работы на хостинге нужно более серьезное решение. В нашем случае -- nginx. 

НАм нужно его установить:
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

### Настройка nginx для нашего проекта

Теперь надо настроить наш сайта в nginx. Создаем каталоги для хранения логов, конфигурационных файлов и сокета. 
```bash
mkdir -p $HOME/[адрес сайта]/logs
mkdir -p $HOME/[адрес сайта]/conf
mkdir -p $HOME/[адрес сайта]/sock
```

Создаём конфигурационный файл `[адрес_сайта]_nginx.conf`:
```bash
nano $HOME/[адрес сайта]/conf/[адрес_сайта]_nginx.conf
```
Со следующим содержанием:
```
#       ___  ___   ___    ___  __  __  ____  ____  ___     ____  __  __
#      / __)(__ \ / __)  / __)(  )(  )(  _ \( ___)(__ \   (  _ \(  )(  )
#     ( (__  / _/( (_-. ( (__  )(__)(  ) _ < )__)  / _/    )   / )(__)(
#      \___)(____)\___/()\___)(______)(____/(____)(____)()(_)\_)(______)
# Конфикурационный файл nginx для сайта [адрес сайта] ([адрес_сайта]_nginx.conf)

# не забываем изменять _user_ на имя нашего пользователя, которому будет разрешено деплоить и перезапускать сайт.

# Описываем апстрим-потоки которые должен подключить Nginx
# Для каждого сайта надо настроить свйо поток, со своим уникальным именем.
# Если будете настраивать несколько python (django) сайтов - измените название upstream

upstream [адрес_сайта]_django {
    # расположение файла Unix-сокет для взаимодействие с uwsgi
    server unix:///home/[user]/[адрес сайта]/sock/[адрес_сайта].sock;
    # также можно использовать веб-сокет (порт) для взаимодействие с uwsgi. Но это медленнее
    # server 127.0.0.1:8001; # для взаимодействия с uwsgi через веб-порт
}

# конфигурируем сервер
server {
    listen      80;                  # порт на котором будет доступен наш сайт
    server_name [адрес сайта];       # доменное имя сайта
    charset     utf-8;               # подировка по умолчанию
    access_log  /home/[user]/[адрес сайта]/logs/[адрес_сайта]_access.log;    # логи с доступом
    error_log   /home/[user]/[адрес сайта]/logs/[адрес_сайта]_error.log;     # логи с ошибками
    client_max_body_size 32M; # максимальный объем файла для загрузки на сайт (max upload size)

    location /media         { alias /home/[user]/[адрес сайта]/classifier-manager/media; }       # Расположение media-файлов Django
    location /static        { alias /home/[user]/[адрес сайта]/classifier-manager/static; }      # Расположение static-файлов Django
    location /robots.txt    { root /home/[user]/[адрес сайта]/classifier-manager/static; }       # Расположение robots.txt
    location /favicon.ico   { root /home/[user]/[адрес сайта]/classifier-manager/static; }       # Расположение favicon.ico
    location / {
        uwsgi_pass  [адрес_сайта]_django;        # upstream обрабатывающий обращений  
        include     uwsgi_params;               # конфигурационный файл uwsgi;
        proxy_read_timeout     900;
        }
        
    }
```  
Проверьте все скобочки и точки с запятой... Они могут создать много неприятностей. Сохраняем файл `Ctrl+O` и `Enter`, а затем выходим из редактора nano с помощью `Ctrl+X`.

Эта конфигурация сообщает nginx, каким образом он отдает данные при обращении к **[адрес сайта]** по порту **80**. Так, при обащении статическим и загруженным пользователем файлам, он отдает их из соответсвующих каталогов, а остальные  запросы будут перенаправлятся в Django-приложение через апстрим `[адрес_сайта]_django`, который работает через юникосвкий файл-сокет `unix:///home/[user]/[адрес сайта]/sock/[адрес_сайта].sock`.

По умолчанию файл конфигурации uWSGI нажодится в папке _/etc/nginx/uwsgi_params_ и мы спользуем именно его, но при желании мы может переопределить eго. К слову сказать, в ранних версиях nginx файл _uwsgi_params_ в поставку не входил. Проверьте есть ли он у вас, и при необходимости [загрузите из git-репозитория разработчиков nginx](https://github.com/nginx/nginx/blob/master/conf/uwsgi_params).

Чтобы nginx подключил наш новый файл конфигурации сайта нужно добавьте ссылку на него в каталог `/etc/nginx/sites-enabled/`:
```bash
sudo ln -s $HOME/[адрес сайта]/[адрес_сайта]_nginx.conf /etc/nginx/sites-enabled/
```

Теперь нужно перезагрузить nginx
```bash
sudo service nginx restart
```

В результате статические файлы теперь будут отдаваться в браузер. Так вызвав `http://[адрес сайта]/static/img/cubex.png` получим картинку:

![Что показываю по http://[адрес сайта]/static/img/cubex.png](https://raw.githubusercontent.com/erjemin/classifier-manager/master/static/img/cubex.png "cubex.png")

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

---------------------

# Установка и настройка uWSGI

Если при настройке виртуального окружения нам не потребвался пакет разработчика пакет **python-dev**, то теперь нам бязательно нужно его установить:
```bash
sudo apt-get install python-dev 
```

В nginx (как впрочем и в други веб-серверах) обмен данными с python-приложениями происходит через WSGI (Web Server Gateway Interface). В его основе лежат сокеты (нечто вроде общего блока памяти к которому может обращаться и веб-сервер и приложение) через которые пробрасыватся данные между приложением и сервером. Существуем множество сервисов WSGI -- gunicorn, passenger_wsgi, flup, FastCGI (вот [далеко не полный список WSGI] (http://wsgi.readthedocs.io/en/latest/servers.html) -- и для нашего сервера мы выберем uWSGI. Он достаточно компактен, шустрый и не прожорливый. Для миниатюрного Paspbery pi -- самое то. Можно установить uWSGI в виртуальное окружение, но если мы хотим чтобы и другие Python-сайты нашего сервре могли его использоватьна, то лучше производить установку на системном уровне:
```bash
sudo pip install uwsgi
```

Теперь создаем файл конфигурации uwsgi для нашего проекта. В нем буду описано какое виртуальное окружение использует проект.
```bash
nano $HOME/[адрес сайта]/conf/c2g_cube2_ru_uwsgi.ini
```
Сожержание этого файла будет примерно таким
```
# [адрес_сайта]_uwsgi.ini -- настройки uWSGI для [адрес сайта]
[uwsgi]

# НАСТРОЙКИ ДЛЯ DJANGO
# Корневая папка проекта (полный путь)
chdir           = /home/[user]/[адрес сайта]/classifier-manager
# Django wsgi файл
module          = classifier.wsgi
# полный путь к виртуальному окружению
home            = /home/[user]/[адрес сайта]/env
# полный путь к файлу сокета
socket          = /home/[user]/[адрес сайта]/sock/[адрес_сайта].sock
# Исходящие сообщения в лог
daemonize       = /home/[user]/[адрес сайта]/logs/[адрес_сайта]_uwsgi.log

#  НАСТРОЙКИ ОБЩИЕ
# быть master-процессом
master          = true
# максимальное количество процессов
processes       = 4
# права доступа к файлу сокета. По умолчаниюдолжно хватать 664. Но каких-то прав не хватает, поэтому 666.
chmod-socket    = 666
# очищать окружение от служебных файлов uwsgi по завершению
vacuum          = true
# количество секунд после которых подвисший процес будет перезапущен
№ Так как некоторе скрипты требуют изрядно времени (особенно полная переиндексация) то ставим значение побольще
harakiri      = 900
# В общес случае, при некотых значениях harakiri логах uWSGI может вываливаться предупреждение:
# WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers
# можно оставить harakiri закоментированным, но нам нужно 900 и на него не ругается. Ругается на 30.

# разрешаем многопоточность
enable-threads  = true
vacuum          = true
thunder-lock    = true
max-requests    = 500

# пользователь и группа пользователей от имени которых запускать uWSGI
# указываем www-data: к этой группе относится nginz, и ранее мы включили в эту группу нашего [user]
uid             = www-data
gid             = www-data

print           = ---------------- Запущен uWSGI для [адрес сайта] ----------------
```

Запускаем uwsgi с нашим конфигом:
```bash
uwsgi --ini /home/[user]/[адрес сайта]/conf/[адрес_сайта]_uwsgi.ini
```

### Провекра корректности работы uWSGI и что делать если что-то не так

Если ничего не заработало, то проверяем файл логов `/home/[user]/[адрес сайта]/logs/[адрес_сайта]_uwsgi.log`. Просмативаем лог с помощью команды:
```bash
cat /home/[user]/[адрес сайта]/logs/[адрес_сайта]_uwsgi.log
```

В нем отображаются все сообщения инициализации uwsgi. Внизу находятся самые свежие записи. Записи выводятся в несколько строк, и каждая запись начинается со строки: `*** Starting uWSGI`. 

В случае ошибок при запуске разбаемся и курим мануалы.

Ошибки моут быть вот такие:
> * * * ** WARNING: you are running uWSGI as root !!! (use the --uid flag) ** * * *

Значит мы запустили uWSGI от имени адменистратора. НА надо от имени текущего пользователя [user].



> *** WARNING: you are running uWSGI without its master process manager ***

Но если вы все сделали правильно в соответствии с настоящей инструкцией, критических проблем возникнуть не должно. Тем не менее просмотреть логи uwsqi все равно полезно. Например, кроме предупреждения ***WARNING: you have enabled harakiri without post buffering. Slow upload could be rejected on post-unbuffered webservers*** о котором сказано в комментариях к `[адрес_сайта]_uwsgi.ini`  нас могут беспокоить сообщения: ***!!! no internal routing support, rebuild with pcre support !!!*** Это означает, что у нас установлен однопоточный uWSGI при многопоточном nginx и процессоре. Можно устанjвить в `[адрес_сайта]_uwsgi.ini` инстукцию использования однопоточности `enable-threads = false`, но лучше собрать многопоточный uWSGI с pcre.

Для этого нам понадобятся пакеты разработчиков.
```bash
sudo apt-get install libpcre3 libpcre3-dev
```

Нам нужно удалить неправильный uWSGI и установить новый, дав указание пересрбрать его:
```
sudo pip uninstall uwsgi
sudo apt-get purge uwsgi
sudo pip install uwsgi -I
```

В конце установщик выдаст:
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
   
Как видим `pcre = True`, значит у нас теперь многопоточный uWSGI.

Еще раз запускаем uWSGI с нашим конфигом:
```bash
uwsgi --ini /home/[user]/[адрес сайта]/conf/c2g_cube2_ru_uwsgi.ini
```
Открываем в браузере сайт _http://[адрес сайта]_. И если он открывается с ошибкой 502, то смотрим логошибок nginx:
```bash
cat /home/[user]/[адрес сайта]/logs/[адрес_сайта]_error.log
```

#### Виды ошибок:
##### Первая:
> 2016/10/16 01:05:45 [crit] 26651#0: *2 connect() to unix:///home/[user]/[адрес сайта]/sock/[адрес_сайта].sock failed (13: Permission denied) while connecting to upstream, client: 192.168.1.1, server: [адрес сайта], request: "GET / HTTP/1.1", upstream: "uwsgi://unix:///home/[user]/[адрес сайта]/sock/[адрес_сайта].sock:", host: "[адрес сайта]"

Означает, что не хватает прав на доступ к сокету. По идее в нашем `[адрес_сайта]_uwsgi.ini` должно хватать `chmod-socket = 664`, но непонтяно почему не хватает. Меняем на `chmod-socket = 666`. 

#### Вторая:
> 2016/10/16 01:36:34 [error] 26844#0: *7 upstream prematurely closed connection while reading response header from upstream, client: 192.168.1.1, server: [адрес сайта], request: "GET / HTTP/1.1", upstream: "uwsgi://unix:///home/[user]/[адрес сайта]/sock/[адрес_сайта].sock:", host: "[адрес сайта]"

Означает, что ошибка на стороне python-скриптов нашего Django-приложения. Очевидно мы что-то сделали неправильно при установке виртуально окружения, развертывании проекта и его настройке и проверки. Надо перепрверить развертывание и возможно повторить его.

### Устанавливаем Emperor-режим uWSGI

Если сервер обслуживает несколько проектов, каждый из которых использует uWSGI, то нужно использовать режим Emperor. В этом режиме uWSGI просматривает папку с конфигурационными файлами и для каждого файла запускает отдельный подчиненный процесс (вассал).

Особенно удобно Emperor-режиме то, что если один из конфигурационных файлов будет изменен, uWSGI перезапустит соответствующего вассала.

Создаем системную папку для конфигурационных файлов:
```bash
sudo mkdir /etc/uwsgi
sudo mkdir /etc/uwsgi/vassals
```

Создаем в ней симлинк на наш ini-файл uWSGI:
```bash
sudo ln -s /home/[user]/[адрес сайта]/conf/[адрес_сайта]_uwsgi.ini /etc/uwsgi/vassals/
```

Теперь, можно запустить uWSGI в режиме Emperor, указав с помощью ключа `--emperor` папку с симлимками на конфигурациолнные ini-файлы, и с помощью `--uid` и `--gid` пользователя и группу от имени которых должен работать uWSGI:
```bash
sudo uwsgi --emperor /etc/uwsgi/vassals --uid [user] --gid [user]
```

Чтобы  uWSGI запускался автоматически при каждой загрузке нашего Raspberri pi необходимо изменить файл `/etc/rc.local`. Открываем его на редактирование:
```bash
sudo nano /etc/rc.local
```

И перед самой последней строчкой `exit 0` вставляем в него команду запука uWSGI. Должно получиться примерно так:
```bash
/usr/local/bin/uwsgi --emperor /etc/uwsgi/vassals --uid [user] --gid [user]
exit 0
```
Теперь можно перезагрузить наш сервер и убедиться, что uWSGI запустился и наш сайт `[адрес_сайта]` открывается в браузере.



------
Данная микросистема управление деревьями работает во внутренних интерфейсах [Торгово-логистического портала **CargоToGo**] (http://cargotogo.com) и [Маркет-плейс агрегатора окон **«Окнардия»**] (http://oknardia.ru). Надеюсь, что проделанная работа пригодится и вам. Успехов!


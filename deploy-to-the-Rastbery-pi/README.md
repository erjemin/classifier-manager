Как развертывать под Linux
==============================

В моем случае под Debian GNU/Linux установленом на Raspberry pi 3.
Развертывание под другие разновидности Debian (Ubuntu, Runtu, gNewSense и пр.) не должно отличаться.

Установка пакетов до виртуального окружения
-------------------------

# Устанавливаем веб-вервер nginx.

Так как могут быть уже установлен web-сервер **Apache**, то его придется его удалить. Сначала удаляем все компоненты:
```bash
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
```

Затем чистим неиспользуемые («подвисшие») зависимые пакеты, что не удалилось с помощью прошлой команды:
```bash
apt-get autoremove
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
apt-get update
```

Теперь можем приступить к установке **nginx**. К сожалению, в репозиториях Debian для Raspbery pi лежат не самые свежие пакеты. Аредпочтительна установки из исходников. Устанавливает пакеты, необходимые для сборки nginx из исходников (компилятор С++, библиотеки и все такое):
```bash
sudo apt-get install gcc
sudo apt-get install build-essential 
sudo apt-get install libpcre3-dev 
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libexpat1-dev
```

Смотрим [на сайте nginx] (http://nginx.org/ru/download.html) акутальную стабильную версию, скачиваем ее в домашнюю директорию и расспаковываем исходники. Переходим в папку, в которую все распокавалось. В ней будем собирать пакет:
```bash
cd ~
wget http://nginx.org/download/nginx-1.11.1.tar.gz 
tar -zxvf nginx-1.11.1.tar.gz 
cd nginx-1.11.1.tar.gz
```
Командой `nano conf.sh` создаем командный файл: 
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
--add-module=/root/nginx/nginx-webdav-ext/

------
Данная микросистема управление деревьями работает во внутренних интерфейсах [Торгово-логистического портала **CargоToGo**] (http://cargotogo.com) и [Маркет-плейс агрегатора окон **«Окнардия»**] (http://oknardia.ru). Надеюсь, что проделанная работа пригодится и вам. Успехов!

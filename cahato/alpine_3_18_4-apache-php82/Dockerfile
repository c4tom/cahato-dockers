# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

FROM cahato/alpine_3_18_4-apache:latest

ADD files.tar /scripts

ENV      SHENV_NAME=APACHE_php82 \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=apache_php82.docker \
            WWW_DIR=www \
          WWW_INDEX=index.php \
      FIX_OWNERSHIP=1 \
      PHP_FILE_INFO=1 \
         HTTPD_INFO=1 \
             CFLAGS=-DBIG_SECURITY_HOLE

EXPOSE 80

RUN apk --update add php82-embed php82-enchant php82-pecl-redis php82-pecl-apcu php82-posix php82-pecl-protobuf php82-pecl-uploadprogress php82-dba \
php82-pecl-xhprof php82-bz2 php82-pdo php82-pecl-msgpack php82-pecl-mongodb php82-pcntl php82-pdo_mysql php82-fileinfo php82-soap \
php82-pecl-imagick php82-sodium php82-pecl-memcache php82-opcache php82-pdo_odbc php82-pecl-amqp php82-common php82-pecl-igbinary \
php82-exif php82-mbstring php82-pdo_pgsql php82-curl php82-litespeed php82-pspell php82-intl php82-ffi \
php82-pecl-xhprof-assets php82-iconv php82-xsl php82-xml php82 php82-apache2 php82-mysqli php82-odbc php82-pear \
php82-mysqlnd php82-pecl-ssh2 php82-tokenizer php82-zip php82-pdo_sqlite php82-pgsql \
php82-pecl-swoole php82-calendar php82-pecl-memcached php82-xmlreader php82-gettext php82-pecl-xdebug php82-ctype php82-sqlite3 \
php82-phpdbg php82-sysvsem php82-sysvshm php82-shmop php82-tidy php82-pecl-ast php82-pecl-zstd php82-brotli \
php82-sysvmsg php82-pecl-uuid php82-fpm php82-gmp php82-imap php82-simplexml php82-sockets php82-openssl php82-pecl-lzf php82-pecl-yaml \
php82-bcmath php82-xmlwriter php82-snmp php82-session php82-gd php82-pecl-psr php82-pecl-maxminddb php82-ldap php82-dom php82-phar php82-ftp

RUN bash /scripts/install.sh
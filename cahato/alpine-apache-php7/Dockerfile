# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

FROM cahato/alpine-apache:latest

ADD files.tar /scripts

ENV      SHENV_NAME=APACHE_PHP7 \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=apache_php7.docker \
            WWW_DIR=www \
          WWW_INDEX=index.php \
      FIX_OWNERSHIP=1 \
      PHP_FILE_INFO=1 \
         HTTPD_INFO=1 \
             CFLAGS=-DBIG_SECURITY_HOLE

EXPOSE 80

RUN apk --update add php7-apache2 php7-mbstring php7-session php7-phar php7-zlib php7-zip php7-ctype \
php7-mysqli php7-xml php7-pdo_mysql php7-opcache php7-pdo php7-json php7-curl \
php7-gd php7-mcrypt php7-openssl php7-dom  \
php-pdo_odbc php-soap php-pgsql php7-pecl-xdebug php7-iconv php7-intl

RUN bash /scripts/install.sh
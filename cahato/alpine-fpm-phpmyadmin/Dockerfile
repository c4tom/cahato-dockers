FROM cahato/alpine

ADD files.tar /scripts

ENV  SHENV_NAME=PMA_FPM \
    SHENV_COLOR=132 \
        WWW_DIR=www \
   PMA_VERSION=5.1.0 

RUN apk update && apk add --no-cache php7-fpm php7-mysqli php7-pdo php7-litespeed

# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-${PMA_VERSION}-all-languages.tar.xz
COPY phpMyAdmin-${PMA_VERSION}-all-languages.tar.xz /root
ADD docker.conf /etc/php7/php-fpm.d
ADD zz-docker.conf /etc/php7/php-fpm.d

RUN bash /scripts/install.sh

WORKDIR /app/${WWW_DIR}
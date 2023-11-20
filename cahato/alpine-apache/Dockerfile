# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

FROM cahato/alpine:latest

ADD files.tar /scripts

ENV      SHENV_NAME=ALPINE-APACHE \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=apache.docker \
            WWW_DIR=www \
          WWW_INDEX=index.html \
      FIX_OWNERSHIP=1 \
        APACHE_USER=www-data \
       APACHE_GROUP=www-data \
         APACHE_UID=1000 \
         APACHE_GID=1000 \
         HTTPD_INFO=1 \
             CFLAGS=-DBIG_SECURITY_HOLE         

# PHP_FPM_CONTAINER
# PHP_FPM_CONTEXT

RUN addgroup -g ${APACHE_GID} ${APACHE_GROUP} && \
  adduser -H -u ${APACHE_UID} ${APACHE_USER} -G ${APACHE_GROUP} -D -s /sbin/nologin && \
  apk add apache2 apache2-proxy apache-mod-fcgid apache2-brotli apache2-utils certbot-apache apache2-ssl  apache2-webdav apache2-http2 apache2-ldap

EXPOSE 80

RUN bash /scripts/install.sh

WORKDIR /app/www

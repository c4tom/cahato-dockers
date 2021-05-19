FROM cahato/alpine

ADD files.tar /scripts

ENV  SHENV_NAME=Mysql \
    SHENV_COLOR=132

EXPOSE 3306

VOLUME ["/var/lib/mysql", "/dump"]

RUN bash /scripts/install.sh

COPY resolveip.sh /usr/bin/resolveip

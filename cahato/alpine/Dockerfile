# @app      cahato/alpine
# @author   cahato https://github.com/c4tom

FROM alpine:3.13

MAINTAINER a-Sansara https://github.com/a-sansara

ADD files.tar /scripts

ENV     TERM=xterm \
   SHENV_CTX=LOCAL \
  SHENV_NAME=Alpine \
 SHENV_COLOR=97 \
          TZ=America/Sao_Paulo

VOLUME /app

RUN apk --update add bash && bash /scripts/install.sh

ENTRYPOINT ["/scripts/main.sh"]

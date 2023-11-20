# @app      cahato/alpine
# @author   cahato https://github.com/c4tom

FROM alpine:3.18.4

ADD files.tar /scripts

ENV     TERM=xterm \
   SHENV_CTX=LOCAL \
  SHENV_NAME=Alpine \
 SHENV_COLOR=97 \
          TZ=America/Sao_Paulo

VOLUME /app


RUN apk --update add bash curl && \
   bash /scripts/install.sh

ENTRYPOINT ["/scripts/main.sh"]

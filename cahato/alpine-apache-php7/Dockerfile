# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

FROM cahato/alpine

ADD files.tar /scripts

ENV      SHENV_NAME=PHP7 \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=php7.docker \
            WWW_DIR=www \
          WWW_INDEX=index.php \
      FIX_OWNERSHIP=1 \
                 TZ=America/Sao_Paulo

EXPOSE 80

RUN bash /scripts/install.sh

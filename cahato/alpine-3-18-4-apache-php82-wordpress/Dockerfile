# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

FROM cahato/alpine-3-18-4-apache-php82

ADD files.tar /scripts

ENV      SHENV_NAME=APACHE_PHP81_WORDPRESS \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=apache_wordpress.docker \
            WWW_DIR=www \
          WWW_INDEX=index.php \
 WORDPRESS_DIR_NAME=site \
         WP_INSTALL=false \
    WP_URL_DOWNLOAD=https://br.wordpress.org/latest-pt_BR.tar.gz

# if WORDPRESS_DIR_NAME equal "" (EMPTY), the files is copy on /app/www 
# WP_URL_DOWNLOAD only type: tar.gz

EXPOSE 80

RUN bash /scripts/install.sh

#!/usr/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

# https://stackoverflow.com/questions/59862387/how-to-deploy-php-fpm-on-docker-container-and-apache-nginx-on-localhost-ubuntu
# https://jordanconway.com/set-up-apache-2-4-with-php-fpm-on-ubuntu-13-10/

VHOST_FCGI=""
# if [ ! -z "${PHP_FPM_CONTAINER}" ]
# then
#     VHOST_FCGI="$(cat <<-EOF
# <IfModule mod_fcgid.c>
#     Options +ExecCGI
#     FcgidConnectTimeout 20
#     AddType  application/x-httpd-php .php
#     AddHandler application/x-httpd-php .php
#     ProxyPassMatch ^/${PHP_FPM_CONTEXT}/(.*\.php(/.*)?)$ fcgi://${PHP_FPM_CONTAINER}/\$1"
# </IfModule>
# EOF
# )"
# fi


if [ ! -z "${PHP_FPM_CONTAINER}" ]
then
    VHOST_FCGI="$(cat <<-EOF
   <FilesMatch \.php$>
        SetHandler proxy:fcgi://${PHP_FPM_CONTAINER}
    </FilesMatch>
EOF
)"
fi

 

cat <<EOF > "/etc/apache2/conf.d/vhost.conf"
<VirtualHost *:80>
    ServerName $HTTP_SERVER_NAME
    SetEnvIfNoCase ^Authorization$ "(.+)" HTTP_AUTHORIZATION=\$1
    
    ${VHOST_FCGI}

    <Directory /app/$WWW_DIR>
        AllowOverride All
        Require all granted
        DirectoryIndex $WWW_INDEX index.html
        <IfModule mod_rewrite.c>
            Options -MultiViews +FollowSymlinks
            RewriteEngine On
        </IfModule>
    </Directory>
</VirtualHost>
# IncludeOptional /etc/apache2/conf.d/vhost2.conf
EOF

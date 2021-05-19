#!/usr/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

if [ ! -d /app/$WWW_DIR ]; then
    echo create dir mode
    CREATE_WWW_DIR=1
    mkdir -p /app/$WWW_DIR
fi
if [ ! -f /app/$WWW_DIR/$WWW_INDEX ]; then
    echo "<?php phpinfo();" >  /app/$WWW_DIR/$WWW_INDEX
fi
tmpsed='s#^DocumentRoot ".*#DocumentRoot "/app/'$WWW_DIR'"#g'
sed -i "$tmpsed" /etc/apache2/httpd.conf
sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf

if [ ! -z "$FIX_OWNERSHIP" ] && [ "$FIX_OWNERSHIP" -eq 1 ] && [ -d /app/$WWW_DIR ]; then
    chown -R 1000:apache /app/$WWW_DIR
fi

touch /var/log/apache2/error.log

tail -F /var/log/apache2/error.log &

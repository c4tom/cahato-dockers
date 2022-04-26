#!/usr/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

WEB_DIR=/app/$WWW_DIR
APACHE_CONF=/etc/apache2/httpd.conf

sed -i "s/User apache/User $APACHE_USER/" $APACHE_CONF
sed -i "s/Group apache/Group $APACHE_GROUP/" $APACHE_CONF

# NPM not support
# apache2-http2

if [ ! -d $WEB_DIR ]; then
    mkdir -p $WEB_DIR
fi

if [ ! -f $WEB_DIR/$WWW_INDEX ]; then
    echo "Hello World" > $WEB_DIR/$WWW_INDEX
fi

sed -i 's#^DocumentRoot ".*#DocumentRoot "/app/'$WWW_DIR'"#g' $APACHE_CONF
sed -i 's#AllowOverride none#AllowOverride All#' $APACHE_CONF


if [ "$FIX_OWNERSHIP" = "1" ]; then
    echo "Set Permission: $WEB_DIR";
    chown -R $APACHE_USER:$APACHE_GROUP $WEB_DIR
fi
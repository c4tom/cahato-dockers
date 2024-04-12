#!/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

function a2setModule(){
    local enable=${1:-''}
    local   path=${3:-'/etc/apache2/httpd.conf'}
    local   scom=''
    local   rcom='\#'
    if [ ! -z $1 ] && [ ! -z "$2" ]; then
        if [ "$enable" = 1 ]; then
            scom='\#'
            rcom=''
        fi
        echo "$2"
        sed -i "s#${scom}LoadModule $2_module modules/mod_$2.so#${rcom}LoadModule $2_module modules/mod_$2.so#" "$path"
    fi
}
if [ ! -f /usr/bin/php ]; then
    ln -s /usr/bin/php82 /usr/bin/php
fi
if [ ! -f /usr/lib/libxml2.so ]; then
    ln -s /usr/lib/libxml2.so.2 /usr/lib/libxml2.so
fi

if [ ! -d /run/apache2 ]; then
    mkdir /run/apache2
fi

mkdir -p /run/apache2
chown $APACHE_USER:$APACHE_GROUP /run/apache2

initTitle "Apache" "Loading Modules"

a2setModule 1 "rewrite"
a2setModule 1 "mpm_prefork"
#a2setModule 1 "slotmem_shm"
a2setModule 1 "heartmonitor"
a2setModule 1 "vhost_alias"
#a2setModule 1 "http2" 
a2setModule 1 "deflate"
#a2setModule 1 "watchdog"

initTitle "Apache" "Removing Modules"
a2setModule 0 "mpm_event"

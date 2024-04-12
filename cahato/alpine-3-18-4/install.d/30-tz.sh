#!/bin/bash
# @app      cahato/alpine
# @author   cahato https://github.com/c4tom

# https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts#setup-timezone

if [ ! -f "/etc/TZ" ] || [ ! -f "/sbin/setup-timezone" ]; then
    apk --update add tzdata alpine-conf
    echo $TZ > /etc/TZ
fi

setup-timezone -z $TZ

echo -e "\033[1;38;5;203mTIMEZONE : $TZ"
date
echo -en "\033[m"

apk del tzdata alpine-conf
#!/bin/bash

if [ $(cat /etc/TZ) != $TZ ]; then 
    echo $TZ > /etc/TZ
    . /scripts/install.d/30-tz.sh
    . /scripts/install.d/40-clean_apk_cache.sh
fi
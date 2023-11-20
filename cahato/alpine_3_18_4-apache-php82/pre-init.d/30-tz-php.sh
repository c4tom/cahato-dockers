#!/bin/bash
tmpsed="/etc/php81/php.ini"
sed -i "s|;*date.timezone =.*|date.timezone = ${TZ}|i" $tmpsed
cat $tmpsed | grep "^date.timezone"

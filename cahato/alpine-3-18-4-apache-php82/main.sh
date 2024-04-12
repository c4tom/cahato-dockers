#!/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom
set -e

. /scripts/common.sh

rm -f /run/apache2/httpd.pid

initTitle "Starting" "Apache Daemon"
httpd -D FOREGROUND

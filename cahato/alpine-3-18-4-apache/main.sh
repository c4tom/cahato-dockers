#!/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

. /scripts/common.sh

initTitle "Starting" "Apache Daemon"

httpd -D FOREGROUND

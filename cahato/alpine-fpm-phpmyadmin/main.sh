#!/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom
set -e

. /scripts/common.sh

initTitle "Starting" "PHPMyAdmin FPM Daemon"

php-fpm7
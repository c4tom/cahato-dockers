#!/bin/bash
# @app      cahato/alpine-mysql
# @author   cahato https://github.com/c4tom

. /scripts/common.sh
exec /usr/bin/mysqld --user=mysql --console

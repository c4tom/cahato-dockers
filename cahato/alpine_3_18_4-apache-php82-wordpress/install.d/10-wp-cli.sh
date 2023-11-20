#!/bin/bash
# @app      cahato/alpine-apache-php7-wordpress
# @author   cahato https://github.com/c4tom

cd /tmp

curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp

chmod +x /usr/local/bin/wp

echo 'alias wp="/usr/local/bin/wp --allow-root --skip-plugins --skip-themes --skip-packages"' >> /root/.bashrc

apk update

# Resolve problem with "less -r" run with wp-cli
apk add --update less

# Add mariadb client, required for wp db [cli|export|import...]
apk add mariadb-client
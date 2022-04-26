#!/bin/bash
# @app      cahato/alpine-apache-php7-wordpress
# @author   cahato https://github.com/c4tom

cd /tmp

curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp

chmod +x /usr/local/bin/wp

echo 'alias wp="/usr/local/bin/wp --allow-root --skip-plugins --skip-themes --skip-packages"' >> /root/.bashrc

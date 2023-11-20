#!/bin/sh

downloadWP() {
  echo "Installing WP latest version..."
  cd /tmp; 
  local wp_file="wp.tar.gz"
  wget ${WP_URL_DOWNLOAD} -O $wp_file
  tar xzf $wp_file
  cp -fr wordpress/* "$1"
  rm -fr $wp_file wordpress
}

# WORDPRESS_DIR_NAME can be "" (empty) or
# WORDPRESS_DIR_NAME any name

# Check if have any wordpress installed

if [ -z "${WORDPRESS_DIR_NAME}" ]; then
    WP_DIR_CONTENT="/app/${WWW_DIR}/wp-content"
  else
    WP_DIR_CONTENT="/app/${WWW_DIR}/${WORDPRESS_DIR_NAME}/wp-content"
fi

if [[ $WP_INSTALL = "true" ]]
then
  if [ ! -d "$WORDPRESS_DIR_NAME" ]; then
    WP_DIR=$(dirname ${WP_DIR_CONTENT})
    mkdir -p "${WP_DIR}"
    downloadWP "${WP_DIR}"

    chown -R ${APACHE_USER}:${APACHE_GROUP} "${WP_DIR}"
  fi
fi

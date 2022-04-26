
html=$(cat ${WEB_DIR}/${WWW_INDEX})
if [ "${html}" == "<?php echo 'Hello World PHP';" ]; then
    echo "<?php header('Location: ${WORDPRESS_DIR_NAME}/');" > "${WEB_DIR}/${WWW_INDEX}"
fi

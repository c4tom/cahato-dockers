#!/usr/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

WEB_DIR="/app/${WWW_DIR}"

if [ ! -z "${PHP_FILE_INFO}" ]; then 
    echo "<?php phpinfo();" >  "${WEB_DIR}/__info.php"
fi

html=$(cat ${WEB_DIR}/${WWW_INDEX})
if [ "${html}" == "Hello World" ]; then
    echo "<?php echo 'Hello World PHP';" > "${WEB_DIR}/${WWW_INDEX}"
fi

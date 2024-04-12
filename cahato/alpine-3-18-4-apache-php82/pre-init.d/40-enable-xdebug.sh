
# enable xdebug coverage for testing with phpunit (already installed)

if [ ! -z "$PHP_XDEBUG_ENABLED" ]
	then
      local xdebug_ini="/etc/php82/conf.d/50_xdebug.ini"
		echo "Enable XDebug..."
		echo 'zend_extension=/usr/lib/php82/modules/xdebug.so' >> $xdebug_ini;
		echo 'xdebug.idekey = VSCODE' >> $xdebug_ini;
		echo 'xdebug.remote_host = host.docker.internal' >> $xdebug_ini;
		echo 'xdebug.file_link_format = "vscode://file/%f:%l&/var/www/html>/www-data/"' >> $xdebug_ini;
fi
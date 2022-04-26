
# enable xdebug coverage for testing with phpunit (already installed)

if [ ! -z "$PHP_XDEBUG_ENABLED" ]
	then
      local xdebug_ini="/etc/php7/conf.d/50_xdebug.ini"
		echo "Enable XDebug..."
		echo 'zend_extension=/usr/lib/php7/modules/xdebug.so' >> $xdebug_ini;
		echo 'xdebug.coverage_enable=On' >> $xdebug_ini;
		echo 'xdebug.remote_enable=1' >> $xdebug_ini;
		echo 'xdebug.remote_connect_back=1' >> $xdebug_ini;
		echo 'xdebug.remote_log=/tmp/xdebug.log' >> $xdebug_ini;
		echo 'xdebug.remote_autostart=true' >> $xdebug_ini;
fi
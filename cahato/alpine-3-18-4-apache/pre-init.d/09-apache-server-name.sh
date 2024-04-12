# Apache server name change
if [ ! -z "$HTTP_SERVER_NAME" ]
	then
		sed -i "s/#ServerName www.example.com:80/ServerName $HTTP_SERVER_NAME/" /etc/apache2/httpd.conf
		echo "Changed server name to '$HTTP_SERVER_NAME'..."
	else
		echo "NOTICE: Change 'ServerName' globally and hide server message by setting environment variable >> 'HTTP_SERVER_NAME=your.server.name' in docker command or docker-compose file"
fi
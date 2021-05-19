#!/usr/bin/bash
# @app      cahato/alpine-apache
# @author   cahato https://github.com/c4tom

if [ ! -z "/app/vhost" ]; then
    cat <<EOF > "/app/vhost"
<VirtualHost *:80>
    ServerName $HTTP_SERVER_NAME
    SetEnvIfNoCase ^Authorization$ "(.+)" HTTP_AUTHORIZATION=\$1
    <Directory /app/$WWW_DIR>
        AllowOverride None
        Require all granted
        DirectoryIndex $WWW_INDEX
        <IfModule mod_rewrite.c>
            Options -MultiViews +FollowSymlinks
            RewriteEngine On
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^ $WWW_INDEX [QSA,L]
        </IfModule>
    </Directory>
</VirtualHost>
# IncludeOptional /app/vhost2
EOF
fi

if [ ! -z "$REMAP_UID" ]; then
   sed -i "s#:${APACHE_UID}:${APACHE_GID}:#:$REMAP_UID:#" /etc/passwd
fi

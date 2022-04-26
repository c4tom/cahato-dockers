
if [ ! -z "HTTPD_INFO" ]; then
   httpd -t -D DUMP_MODULES
   httpd -t -D DUMP_INCLUDES
   httpd -S
fi
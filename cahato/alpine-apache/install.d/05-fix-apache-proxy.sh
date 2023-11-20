function a2setModule(){
    local enable=${1:-''}
    local   path=${3:-'/etc/apache2/httpd.conf'}
    local   scom=''
    local   rcom='\#'
    if [ ! -z $1 ] && [ ! -z "$2" ]; then
        if [ "$enable" = 1 ]; then
            scom='\#'
            rcom=''
        fi
        echo "$2"
        sed -i "s#${scom}LoadModule $2_module modules/mod_$2.so#${rcom}LoadModule $2_module modules/mod_$2.so#" "$path"
    fi
}

if [ ! -f /usr/lib/libxml2.so ]; then
    ln -sf /usr/lib/libxml2.so.2 /usr/lib/libxml2.so
fi

a2setModule 0 "proxy_fdpass"
a2setModule 0 "mod_watchdog"
a2setModule 0 "slotmem_shm_module"

rm -f /scripts/install.d/05-fix-apache-proxy.sh
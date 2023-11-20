#!/bin/bash
# @app      cahato/alpine
# @author   cahato https://github.com/c4tom

if [ ! -f /root/.bash_ps1 ]; then 
    cat <<EOF >> /root/.bashrc
if [ -f ~/.bash_ps1 ]; then
    . ~/.bash_ps1
fi

for i in /scripts/profile.d/*.sh
do
    source \$i
done

EOF
    sed -n '1,22 p' /scripts/util.sh > /root/.bash_ps1
    echo "bash_prompt" >> /root/.bash_ps1
fi

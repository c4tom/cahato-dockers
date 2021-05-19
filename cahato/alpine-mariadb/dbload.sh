#!/bin/bash
# @app      cahato/alpine-mysql
# @author   cahato https://github.com/c4tom

. /scripts/dbcommon.sh

  dbname=${1:-''}
filename=${2}
  shname=$(basename $0)

echoTitle

function usage(){
    echo -e "\n ${Cusa}usage :${Coff}\n    ${Ctext}$shname \t${Copt}DBNAME FILENAME${Coff}"
}

if [ ! -f "$filename" ]; then
    echoErr "unknow file '$filename'"
fi
if [ ! -z "$1" ]; then
    mysql -uroot "$dbname" < "$filename"
    if [ $? -eq 0 ]; then
        echo -e "\n done"
    fi
    echo
else
    errEmptyDb
fi

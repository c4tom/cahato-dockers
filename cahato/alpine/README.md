# cahato/alpine

- index
- cahato/alpine                     ( ~ 10 MB ) Alpine/3.13
  - cahato/alpine-apache-php7       ( ~ 58 MB ) Apache/2.4.46 Php/7.4.19
  - cahato/alpine-mariadb           ( ~ 49 MB ) MariaDB/10.5.9 ( MariaDB )
- docker tips


This Image provide a Linux Alpine distribution with :
- fully functionnal & colorized terminal
- bash
- curl
- vim as editor

Base image : [alpine:3.13](https://hub.docker.com/_/alpine/)

This project come with a structure to facilitate further images (like cahato/alpine-apache & cahato/alpine-mysql)

__note :__ wget ssl issue

apk add ca-certificates wget && update-ca-certificates
    

## Image Size

- very small image ~ 10 MB


## Image Usage

```
$ docker run --name alpine -it cahato/alpine
```

## Image Structure

```
project/
   |
   |-- install.d/   # deployed in /scripts on target container
   |      |         # launch on docker image building process
   |      |         # XX-name.sh - low XX are run first
   |      |-- 00-util.sh
   |      |-- 40-fix.sh
   |
   |-- pre-init.d/  # deployed in /scripts on target container
   |      |         # launch on docker container running process
   |      |-- 50-builder.sh
   |
   |-- build        # build docker image : ./build [TAG]
   |-- common.sh    # don't modify - sourced by main.sh to execute pre-init.d scripts first
   |-- install.sh   # don't modify - execute install.d scripts on docker building process
   |-- main.sh      # source common.sh then execute entry point instruction
   |-- util.sh      # sourced by common.sh
```

you can easily create your own images based on this structure.  
keep an eye to cahato/alpine-apache, cahato/alpine-apache-php7 & cahato/alpine-mysql wich extend cahato/alpine  


## Extend cahato/alpine Image

RUN instructions are minimized on extended image you only need to use :

```
RUN bash /scripts/install.sh
```
add your packages in a script in install.d directory  
keep name below 40 because install.d/40-fix.sh clean package repository  
each extended image inherit install.d && pre-init.d scripts

extended images doesn't need to define ENTRYPOINT  
you can keep intact build script in each extended project  
manage your install & init instruction in install.d & pre-init.d directory  
and write your own main.sh script  

Docker file example (from cahato/alpine-apache)

```
FROM cahato/alpine

ADD files.tar /scripts

ENV      SHENV_NAME=Apache \
        SHENV_COLOR=67 \
   HTTP_SERVER_NAME=site.docker \
            WWW_DIR=www \
          WWW_INDEX=index.php \
      FIX_OWNERSHIP=1 \
                 TZ=America/Sao_Paulo

EXPOSE 80

RUN bash /scripts/install.sh
```

 1. https://github.com/c4tom/cahato-dockers/cahato
 1. https://github.com/c4tom/cahato-dockers/cahato/tree/master/cahato/alpine
 1. https://github.com/c4tom/cahato-dockers/cahato/tree/master/cahato/alpine-apache-php7
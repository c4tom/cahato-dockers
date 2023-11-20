# cahato/alpine-apache-php7

[Available Images](../../images.md)

Extend cahato/alpine with __apache 2.4.53__ and __php 7.4.26__

- error log are attached to stdout
- no need port redirection
- you can use env var at container creation : __HTTP_SERVER_NAME__ (default : site.docker ortherwise edit /app/vhost later)
- you can still use ever your local http & sql server while your container(s) are running

## Image Size

- image ~ 59 MB

## ENV variables

```
 HTTP_SERVER_NAME=site.docker   # apache ServerName  
          WWW_DIR=www           # DocumentRoot relative to volume  
        WWW_INDEX=index.php     # DirectoryIndex
    FIX_OWNERSHIP=1             # 
```

### Inherit ENV variables

```
        SHENV_CTX=LOCAL         # LOCAL|INT|PROD change context bg color
       SHENV_NAME=Php7          # container name 
      SHENV_COLOR=67            # ANSI EXTENDED COLOR CODE
               TZ=Europe/Paris  # TIMEZONE
```

## Image Volumes

__/app__ directory is a docker volume bind to your app project (silex/symfony etc)

__/app/$WWW_DIR__ is the documentRoot.
put only your entry point and static files to the documentRoot directory, no your app sources
(__/app__ directory is design for this).

__/app/vhost__ is your app vhost configuration file (with a serverName directive).
by default it use the apache rewrite module to redirect all uri to entry point $WWW_INDEX

```
/app/              # your application directory
  |
  |---- $WWW_DIR/  # documentRoot
  |
  |---- vhost     # apache app vhost
```

## Image Usage

chdir to your project directory

```
$ docker run --name php7 -it --link=mysql:db -v $(pwd):/app cahato/alpine-apache
```

or

```
$ docker run --name php7 -it --link=mysql:db -e HTTP_SERVER_NAME=yourServerName -v $(pwd):/app cahato/alpine-apache-php7
```

## Controling http server

```
# reload
$ docker exec -it php7 "httpd -k graceful"
# restart
$ docker exec -it php7 "httpd -k restart"
```

for more commands :

```
$ docker exec -it php7 "httpd -h"
```

1. https://github.com/c4tom/cahato-dockers/cahato
2. https://github.com/c4tom/cahato-dockers/cahato/tree/master/cahato/alpine
3. https://github.com/c4tom/cahato-dockers/cahato/tree/master/cahato/alpine-apache-php7

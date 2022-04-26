## Docker

[Available Images](images.md)

### Networking

#### create network

```
docker network create \
--subnet=172.22.0.0/16 \
--gateway=172.22.0.1 \
-o "com.docker.network.bridge.name"="home0" home0
```

#### inspect ip

```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container
```

#### /etc/hosts

```
# > DOCKER - bridge home0
172.22.0.2	db.docker
172.22.0.9	php7.docker
# <

```

### Util

#### remove all container

```
docker rm $(docker ps -a -q)
```

"rm -v" to also remove volume
"rm -f" to force stop running container before removing

#### remove none images

```
docker rmi $(docker images | grep "^<none>" | awk "{print \$3}")
```

#### remove all volumes

```
docker volume rm $(docker volume ls -qf dangling=true)
```

#### logs container

```
docker logs -f container
```

#### stats container

```
docker stats container
```

### CHT container

#### Mysql

```
cd /home/dev/docker

docker run --name mysql --restart=always \
--net home0 -h db.docker --ip 172.22.0.2 \
-v $(pwd)/db/mysql:/var/lib/mysql \
-v $(pwd)/db/dump:/dump \
-e MYSQL_DATABASE=bo-payment \
-e MYSQL_USER=dev \
-e MYSQL_PASSWORD=mysql \
-d cahato/alpine-mysql
```

#### Apache Php7

```
cd /home/dev/docker

docker run --name php7 --restart=always \
--net home0 -h bo-payment.docker --ip 172.22.0.9 --link mysql:db \
-v $(pwd)/repo/pws-server:/app \
-e HTTP_SERVER_NAME=bo-payment.docker \
-e WWW_DIR=web \
-d cahato/alpine-apache-php7
```

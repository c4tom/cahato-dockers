FROM cahato/alpine:latest

ADD files.tar /scripts

#set enviromental values for certificate CA generation
ENV CN=squid.local \
    O=squid \
    OU=squid \
    C=US

#set proxies for alpine apk package manager
ARG all_proxy

ENV http_proxy=$all_proxy \
    https_proxy=$all_proxy

RUN apk add --no-cache \
    squid \
    openssl \
    ca-certificates && \
    update-ca-certificates


COPY openssl.cnf.add /etc/ssl
COPY conf/squid*.conf /etc/squid/

RUN cat /etc/ssl/openssl.cnf.add >> /etc/ssl/openssl.cnf

EXPOSE 3128
EXPOSE 4128

RUN bash /scripts/install.sh
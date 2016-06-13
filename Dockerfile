#
# Dockerfile for privoxy
# 2016/06/13
# build #3

FROM alpine:3.3
MAINTAINER cloudqq <cloudqq@gmail.com>

RUN set -xe \
    && apk add -U curl privoxy \
    && curl -sSL https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 > /usr/sbin/gosu \
    && chmod +x /usr/sbin/gosu \
    && apk del curl \
    && rm -rf /var/cache/apk/*

RUN sed -i -e '/^listen-address/s/127.0.0.1/0.0.0.0/' /etc/privoxy/config

VOLUME /etc/privoxy

EXPOSE 8118

CMD gosu privoxy privoxy --no-daemon /etc/privoxy/config

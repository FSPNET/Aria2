FROM alpine

ARG ARIANG_VERSION=1.0.1

WORKDIR /root

COPY conf/aria2.conf /root/aria2/aria2.conf
COPY conf/run.sh /root/run.sh

RUN apk upgrade --no-cache && apk update \
    && apk add --no-cache --virtual .build-deps \
        curl \
        wget \
        sed \
    && mkdir -p /data/www/ariang \
    && wget https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VERSION}/AriaNg-${ARIANG_VERSION}.zip \
    && unzip AriaNg-${ARIANG_VERSION}.zip -d /data/www/ariang \
    && rm -rf AriaNg-${ARIANG_VERSION}.zip \
    && chmod +x /root/run.sh \
    && apk del .build-deps \
    && apk add --no-cache aria2
    
VOLUME ["/root/aria2", "/data", "/data/www/ariang"]

EXPOSE 6800 6881 6882/udp

ENV SECRET="value"

CMD /root/run.sh
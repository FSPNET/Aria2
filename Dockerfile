FROM alpine

WORKDIR /root

RUN apk update && apk add --no-cache aria2

COPY conf/aria2.conf /root/aria2/aria2.conf
COPY conf/run.sh /root/run.sh

RUN chmod +x /root/run.sh

VOLUME /root/aria2
VOLUME /data

EXPOSE 6800 6881 6882/udp

ENV SECRET="value"

CMD /root/run.sh
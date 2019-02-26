# Aria2 on Docker

FSP Network Gen2 Server Infrastructure - Aria2

[![MicroBadger Size](https://img.shields.io/microbadger/image-size/fspnetwork/aria2.svg?style=flat-square)](https://microbadger.com/#/images/fspnetwork/aria2)
[![Docker Automated build](https://img.shields.io/docker/automated/fspnetwork/aria2.svg?style=flat-square)](https://hub.docker.com/r/fspnetwork/aria2/)
[![Docker Build Status](https://img.shields.io/docker/build/fspnetwork/aria2.svg?style=flat-square)](https://hub.docker.com/r/fspnetwork/aria2/)
[![GitHub](https://img.shields.io/github/license/fspnet/aria2.svg?style=flat-square)](https://github.com/fspnetwork/aria2/blob/master/LICENSE)

- Port:
    - TCP 6800 RPC listen port
    - TCP 6881 BT listen port
    - UDP 6882 DHT listen port

- Folder:
    - `/root/aria2` aria2 config, session file, DHT file
    - `/data` download folder

## Usage

```sh
docker run -d \
    -- name aira2 \
    -v /DOWNLOAD_DIR:/data \
    -p 6800:6800 \
    -p 6881:6881 \
    -p 6882:6882/udp \
    -e SECRET=YOUR_SECRET \
    fspnetwork/aira2
```
#!/bin/sh
if [ ! -f "/root/aria2/aria2.session" ]; then
  touch /root/aria2/aria2.session
fi

if [ ! -f "/root/aria2/dht.dat" ]; then
  touch /root/aria2/dht.dat
fi

if [ $SECRET ]; then
  grep -q "rpc-secret" /root/aria2/aria2.conf
  if [ $? -eq 0 ];then
    sed -i '/rpc-secret/d' /root/aria2/aria2.conf
  fi
  echo "rpc-secret=${SECRET}" >> /root/aria2/aria2.conf    
fi

# Enable for IPV6 DHT and Edit aria2.conf
#if [ ! -f "/root/aria2/dht6.dat" ]; then
#  touch /root/aria2/dht.dat
#fi

aria2c --conf-path=/root/aria2/aria2.conf
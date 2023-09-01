#! /bin/bash

echo "$(hostname -i)  webhost.local" >>/etc/hosts.log

logpath=/var/log/proxy.out
echo "Start" >> $logpath
envoy >> $logpath 2>&1

echo "Container exited"

#! /bin/bash

echo "$(hostname -i)  webhost.local" >>/etc/hosts.log

logpath=/var/log/haproxy.out
echo "Start" >> $logpath
haproxy -f /etc/haproxy/haproxy.conf -p /var/run/haproxy.pid >> $logpath 2>&1

echo "Container exited"

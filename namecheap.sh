#!/bin/bash
if [ -z "$1" ]; then
echo Usage: ./namecheap.sh [domain] [record_name] [password] [ip]
exit 0
fi
if [ -z "$2" ]; then
echo [record_name] must be used
exit 1
fi
if [ -z "$3" ]; then
echo [password] must be used
exit 1
fi
if [ -n "$4" ]; then
echo Setting $2 on $1 to $4
wget -O /dev/null "https://dynamicdns.park-your-domain.com/update?host=$2&domain=$1&password=$3&ip=$4"
exit 0
fi
while true
do
wget -O /dev/null "https://dynamicdns.park-your-domain.com/update?host=$2&domain=$1&password=$3"
sleep 30
done

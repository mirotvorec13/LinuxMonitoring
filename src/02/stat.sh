#!/bin/bash

echo -n 'HOSTNAME = '
hostname
echo -n 'TIMEZONE = '
timedatectl | grep zone | sed s/' '//g
echo -n 'USER = '
whoami
echo -n 'OS = '
cat /etc/issue | sed -n '1p'
echo -n 'DATE = '
date +'%e %b %Y %X'
echo -n 'UPTIME = '
uptime | sed s/.*'up'//g | sed s/^' '//g | sed s/'  '.*//g
echo -n 'UPTIME_SEC = '
cat /proc/uptime | sed s/' '.*//g
echo -n 'IP = '
hostname -I
echo -n 'MASK = '
ifconfig | grep netmask | sed s/.*'netmask'//g | sed s/^' '*//g | sed s/' '.*//g | sed -n '1p'
echo -n 'GATEWAY = '
ip route | grep default | sed s/.*'via'//g | sed s/^' '*//g | sed s/' '.*//g | sed -n '1p'
echo -n 'RAM_TOTAL = '
free --mega | grep Mem | awk {'print $2'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;'
echo -n 'RAM_USED = '
free --mega | grep Mem | awk {'print $3'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;'
echo -n 'RAM_FREE = '
free --mega | grep Mem | awk {'print $4'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;'
echo -n 'SPACE_ROOT = '
df | grep '/$' | awk {'print $2'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;' | sed 's/[0-9]$//'
echo -n 'SPACE_ROOT_USED = '
df | grep '/$' | awk {'print $3'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{2\}\)/\1.\2/;' 
echo -n 'SPACE_ROOT_FREE = '
df | grep '/$' | awk {'print $4'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;' | sed 's/[0-9]$//'



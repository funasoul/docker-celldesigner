#!/bin/zsh
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
# get my IP from ifconfig en0.
ip=$(/sbin/ifconfig en0 | /usr/bin/grep 'inet ' | /usr/bin/awk '{print $2}')
echo "Bind X11 on docker to ${ip}:0"
docker run -ti --rm -e DISPLAY=${ip}:0 funalab/celldesigner
killall socat

#!/bin/bash
net_count_test=`docker network ls  | grep ' becomewater_net ' | wc -l`
if [ "$net_count_test" == "1" ]
then
  echo "NETWORK ALREADY EXISTS - becomewater_net"
  exit
fi

docker network create --driver=bridge --subnet=172.16.22.0/24 --ip-range=172.16.22.0/24 --gateway=172.16.22.1 becomewater_net
echo "NEW NETWORK CREATED - becomewater_net"

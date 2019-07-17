#!/bin/sh

docker exec -d becomewater_website_1 bash -c "bash /docker/tmp/fix-hosts.sh"
docker exec -d becomewater_website_1 bash -c "bash /docker/docker-start.sh &> /var/log/docker-start.log"

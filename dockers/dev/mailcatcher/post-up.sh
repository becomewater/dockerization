#!/bin/sh

docker exec -d adshares_mailcatcher_1 bash -c "bash /docker/tmp/fix-hosts.sh"

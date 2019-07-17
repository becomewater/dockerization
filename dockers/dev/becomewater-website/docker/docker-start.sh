#!/bin/sh

until cd /website
do
    echo "Waiting for volume mount"
done

# this should become separate container
service php7.2-fpm start

composer install
composer dump-autoload

until [ "$(echo "show databases like '$MYSQL_DATABASE'" | mysql -uroot -hdb.server.dock -p$MYSQL_ROOT_PASSWORD -N $MYSQL_DATABASE 2>/dev/null | wc -l)" -gt 0 ]
do
  echo "Waiting for database server to start"
  sleep 1
done

./artisan migrate
./artisan package:discover

npm install
npm run dev # if you want dynamic updates change this line to 'npm run watch' or 'npm run watch-poll' if issues in watchin ;-)

exit

service supervisor start

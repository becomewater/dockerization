#!/bin/sh

# TODO: client ASD install
#cd /
#git clone https://github.com/adshares/esc.git
#cd ./esc
#make -j esc

until cd /website
do
    echo "Waiting for volume mount"
done

. /docker/.settings

# clear old setups
if [ -e .env ]
then
  rm .env
fi

if [ ! -e .env ]
then
  cp .env.$env .env
fi

if [ ! -z "$MAIL_HOST" ]
then
  sed -i "s/\(^MAIL_HOST.*=\).*/\1$MAIL_HOST/" .env
fi

if [ ! -z "$MAIL_PORT" ]
then
  sed -i "s/\(^MAIL_PORT.*=\).*/\1$MAIL_PORT/" .env
fi

if [ ! -z "$MAIL_USERNAME" ]
then
  sed -i "s/\(^MAIL_USERNAME.*=\).*/\1$MAIL_USERNAME/" .env
fi

if [ ! -z "$MAIL_PASSWORD" ]
then
  sed -i "s/\(^MAIL_PASSWORD.*=\).*/\1$MAIL_PASSWORD/" .env
fi

# this should become separate container
service php7.2-fpm start

composer install
composer dump-autoload

# until [ "$(echo "show databases like '$MYSQL_DATABASE'" | mysql -uroot -hdb.server.dock -p$MYSQL_ROOT_PASSWORD -N $MYSQL_DATABASE 2>/dev/null | wc -l)" -gt 0 ]
# do
#   echo "Waiting for database server to start"
#   sleep 1
# done

# if [ "$resetdata" -gt 0 ]
# then
#   ./artisan migrate:fresh
# else
#   ./artisan migrate
# fi
#
# if [ "$mockdata" -gt 0 ]
# then
#   ./artisan db:seed --class=MockDataSeeder
# fi

./artisan package:discover
./artisan browsercap:updater
./artisan key:generate

npm install
npm run dev # if you want dynamic updates change this line to 'npm run watch' or 'npm run watch-poll' if issues in watchin ;-)

exit

cp /docker/adserver-queue.conf /etc/supervisor/conf.d/
service supervisor start

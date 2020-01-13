#!/bin/bash

cp nginx_noautoindex.conf /etc/nginx/sites-enabled/
mv wordpress /var/web

service mysql start
/etc/init.d/php7.3-fpm start
service nginx start

echo "CREATE DATABASE wordpress;" | mysql -u root

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
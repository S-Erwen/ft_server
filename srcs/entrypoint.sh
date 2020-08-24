#!/bin/bash

chmod +x autoindex.sh

cp nginx_noautoindex.conf /etc/nginx/sites-enabled/
mv wordpress /var/web
chmod 777 -R /var/web

chmod +x mkcert
./mkcert -install
./mkcert localhost

service mysql start
/etc/init.d/php7.3-fpm start
service nginx start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'wpassword';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
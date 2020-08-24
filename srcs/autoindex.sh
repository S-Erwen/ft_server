#!/bin/bash

rm -rf /etc/nginx/sites-enabled/nginx_noautoindex.conf
cp /root/nginx_autoindex.conf /etc/nginx/sites-enabled
service nginx restart
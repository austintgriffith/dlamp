#!/bin/bash

#This files runs inside the container when it first launches

echo "Launching Apache2 webserver...";
/bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND" > /var/www/apache.txt &

echo "Following the apache logs...";
tail -f /var/log/apache2/error.log

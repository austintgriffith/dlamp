#!/bin/bash
echo "Removing existing mysql container...";
docker rm -f mysql
echo "Launching mysql container using custom my.cnf and data container varlibmysql...";
docker run --name="mysql" \
    -e MYSQL_ROOT_PASSWORD=supersecret123 \
    -p 3306:3306 \
    --volumes-from varlibmysql \
    -v ${PWD}/mysql.cnf:/etc/mysql/my.cnf \
    -d mysql:5.7.12

echo "Removing existing container (if it exists)...";
docker rm -f lamp
echo "Launching apache container...;"
docker run --name="lamp" \
    --link mysql:mysql \
    -v ${PWD}/../html:/var/www/html \
    -p 80:80 \
    -d lamp

docker ps

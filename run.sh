#!/bin/bash
echo "Removing existing mysql container...";
docker rm -f mysql
echo "Launching mysql container...";
docker run --name="mysql" -e MYSQL_ROOT_PASSWORD=supersecret123  -d mysql:5.7.12
echo "Removing existing container (if it exists)...";
docker rm -f lamp
echo "Launching apache container...;"
docker run --name="lamp" --link mysql:mysql  -v ${PWD}/html:/var/www/html -v ${PWD}/mysqldata:/var/lib/mysql -p 8080:80 -d lamp

#!/bin/bash
echo "Removing existing mysql container...";
docker rm -f mysql
#echo "Launching mysql container with persistant data in /User/austingriffith/tmp...";
#mkdir /User/austingriffith/tmp
#chmod -R 0777 /User/austingriffith/tmp
#docker run --name="mysql" -e MYSQL_ROOT_PASSWORD=supersecret123 -p 3306:3306 -v /User/austingriffith/tmp:/var/lib/mysql -d mysql:5.7.12
echo "Launching mysql container without persistant data...";
docker run --name="mysql" -e MYSQL_ROOT_PASSWORD=supersecret123 -p 3306:3306 -d mysql:5.7.12
echo "Removing existing container (if it exists)...";
docker rm -f lamp
echo "Launching apache container...;"
docker run --name="lamp" --link mysql:mysql  -v ${PWD}/html:/var/www/html -p 8080:80 -d lamp
docker ps

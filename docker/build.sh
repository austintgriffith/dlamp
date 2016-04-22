#!/bin/bash
echo "Building...";
docker build -t lamp .
echo "Creating data container that will hold mysql data...";
docker run -v /var/lib/mysql --name varlibmysql busybox true
#read more at:https://docs.docker.com/engine/userguide/containers/dockervolumes/





#docker create --name mysql_data -v /var/lib/mysql mysql
#docker volume create -d flocker --name my-mysql-volume -o size=10GB
#docker create -v /var/lib/mysql --name dbstore training/postgres /bin/true

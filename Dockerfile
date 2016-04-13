FROM php:7.0.5-apache

#RUN apt-get update
#RUN apt-get upgrade -y
#RUN apt-get install -y htop

RUN docker-php-ext-install mysqli

ADD bootstrap.sh /root/bootstrap.sh

CMD /root/bootstrap.sh

#choose your php/apache version here: https://hub.docker.com/_/php/
FROM php:7.0.5-apache

RUN docker-php-ext-install mysqli

CMD /bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"

FROM php:8.2-apache

# PHP
RUN apt-get update
RUN apt-get install -y zlib1g-dev libwebp-dev libpng-dev && docker-php-ext-install gd
RUN apt-get install -y libzip-dev && docker-php-ext-install zip

# Apache
RUN a2enmod rewrite
RUN service apache2 restart

ENV BUILD_VERSION "1.4"

EXPOSE 80
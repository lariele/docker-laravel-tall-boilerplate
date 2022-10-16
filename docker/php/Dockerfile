FROM php:8.1.1-fpm

RUN apt-get update -y && apt-get install bash

RUN apt-get install -y libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev

RUN docker-php-ext-install gd
RUN docker-php-ext-enable gd

# Allow Xdebug in dockerfile and docker-compose
#RUN apt-get install -y autoconf build-base
#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug

RUN apt-get install -y libzip-dev exif

RUN docker-php-ext-install pdo pdo_mysql zip bcmath ctype fileinfo exif opcache
RUN docker-php-ext-enable exif
RUN docker-php-ext-configure exif \
            --enable-exif

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# TODO: only on localhost
RUN composer require predis/predis

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
#RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /var/www/html

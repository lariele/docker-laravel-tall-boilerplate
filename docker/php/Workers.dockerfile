FROM php:8.1.1-cli

RUN apt-get update && apt-get install bash

RUN docker-php-ext-install pdo pdo_mysql

ADD ./php/workers.sh /usr/local/bin/workers
RUN chmod u+x /usr/local/bin/workers
CMD /usr/local/bin/workers
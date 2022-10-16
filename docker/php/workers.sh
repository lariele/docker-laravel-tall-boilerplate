#!/bin/bash

set -e

case $CONTAINER_TYPE in
    queue)
        php /var/www/html/artisan queue:work --queue=default --timeout=30 --tries=2
    ;;
    schedule)
        while true
        do
          php /var/www/html/artisan schedule:run --no-interaction
          sleep 61
        done
    ;;
esac

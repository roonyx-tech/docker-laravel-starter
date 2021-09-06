FROM php:7.2-fpm-alpine3.10
RUN apk update && apk add --no-cache supervisor openssh nginx
RUN docker-php-ext-install mysqli pdo_mysql
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

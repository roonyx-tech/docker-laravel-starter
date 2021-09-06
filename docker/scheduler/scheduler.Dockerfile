FROM php:7.2-fpm-alpine3.10

# Install zip php extension
RUN apk add --update --no-cache libzip-dev  xvfb \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

# Install mysqli, pdo_mysql php extensions
RUN docker-php-ext-install mysqli pdo_mysql
RUN apk add --update --no-cache libpng-dev && docker-php-ext-install gd

COPY crontab /etc/crontabs/root

CMD  ["crond", "-f"]

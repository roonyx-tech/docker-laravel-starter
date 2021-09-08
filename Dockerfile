FROM php:7.3-fpm
RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    zip \
    unzip \
    xvfb libfontconfig cron
RUN docker-php-ext-install pdo_mysql zip mbstring
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/cron
# Give execution rihts on the cron job
RUN chmod 0644 /etc/cron.d/cron
# create a log file to be able to run tail
RUN touch /var/log/cron.log

CMD cron && docker-php-entrypoint php-fpm
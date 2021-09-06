#!/usr/bin/env bash

docker-compose exec php_fpm php artisan migrate:fresh --seed

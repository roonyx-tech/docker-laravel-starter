#!/usr/bin/env bash

make stop
make docker-prune
docker volume prune
git pull
docker-compose build && docker-compose up -d

#!/usr/bin/env bash

make stop
git pull
docker-compose build && docker-compose up -d

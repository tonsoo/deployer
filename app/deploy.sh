#!/bin/bash

set -e

echo "Installing dependencies"
docker compose -p "$APP_DOCKER_NAME" exec -T php composer install --no-dev

echo "Migrating database"
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan migrate --force

echo "Cleaning cache"
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan config:clear
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan cache:clear
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan config:cache
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan view:clear
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan optimize:clear
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan optimize

echo "Linking storage"
docker compose -p "$APP_DOCKER_NAME" exec -T php php artisan storage:link
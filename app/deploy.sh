#!/bin/bash

set -e

echo "Running deploy for project $1"

echo "Restarting containers without orphans"
docker compose -p "$1" down
docker compose -p "$1" up -d

echo "Installing dependencies"
docker compose -p "$1" exec -T php composer install --no-dev

echo "Migrating database"
docker compose -p "$1" exec -T php php artisan migrate --force

echo "Cleaning cache"
docker compose -p "$1" exec -T php php artisan config:clear
docker compose -p "$1" exec -T php php artisan cache:clear
docker compose -p "$1" exec -T php php artisan config:cache
docker compose -p "$1" exec -T php php artisan view:clear
docker compose -p "$1" exec -T php php artisan optimize:clear
docker compose -p "$1" exec -T php php artisan optimize

echo "Linking storage"
docker compose -p "$1" exec -T php php artisan storage:link
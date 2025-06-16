#!/bin/bash

set -e

echo "Running deploy for project $1"

echo "Restarting containers without orphans"
docker compose -p "$1" down --remove-orphans
docker compose -p "$1" up -d --build
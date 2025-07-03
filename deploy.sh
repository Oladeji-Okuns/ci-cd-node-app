#!/bin/bash

# --------------------------------------------
# Production Deploy Script (Docker Compose)
# Author: Oladeji
# --------------------------------------------

set -e  # Exit on error

APP_NAME="ci-cd-node-app"
APP_DIR="/home/ubuntu/$APP_NAME"

echo "� Starting deployment using docker-compose..."

# Navigate to app directory
cd "$APP_DIR"

echo "� Pulling latest code..."
git reset --hard
git pull origin main

echo "� Stopping and removing old containers..."
docker-compose down || true

echo "� Building and starting containers..."
docker-compose up -d --build

echo "✅ Deployment complete! App is live on port 80."


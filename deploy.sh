#!/bin/bash

# --------------------------------------------
# Production Deploy Script (Docker Compose)
# Author: Oladeji
# --------------------------------------------

set -e  # Exit on error

APP_NAME="ci-cd-node-app"
APP_DIR="/home/ubuntu/$APP_NAME"

echo "íº€ Starting deployment using docker-compose..."

# Navigate to app directory
cd "$APP_DIR"

echo "í³¦ Pulling latest code..."
git reset --hard
git pull origin main

echo "í·¹ Stopping and removing old containers..."
docker-compose down || true

echo "í´§ Building and starting containers..."
docker-compose up -d --build

echo "âœ… Deployment complete! App is live on port 80."


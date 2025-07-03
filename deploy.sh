#!/bin/bash

# Stop and remove old container
docker stop ci-cd-node-app || true
docker rm ci-cd-node-app || true

# Pull latest code
cd ~/ci-cd-node-app
git pull origin main

# Rebuild and restart container
docker build -t ci-cd-node-app .
docker run -d --name ci-cd-node-app -p 80:3000 ci-cd-node-app


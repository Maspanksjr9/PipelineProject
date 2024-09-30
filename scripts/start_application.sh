#!/bin/bash

# Navigate to the app directory
cd /home/ec2-user/my-app

# Ensure the application is not already running
echo "Stopping any existing Node.js application..."
pkill node || true

# Start the Node.js application
echo "Starting the Node.js application..."
npm start &

echo "Application started successfully."

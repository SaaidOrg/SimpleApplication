#!/usr/bin/env bash

# Update and install dependencies
sudo apt update && sudo apt install -y nodejs npm

# Install PM2 globally
sudo npm install -g pm2

# Stop the existing PM2 application
pm2 stop SimpleApp

# Navigate to the application directory
cd SimpleApplication/

# Install application dependencies
npm install

# Ensure the private key and certificate are written to the correct location
echo "$PRIVATE_KEY" > ./privatekey.pem
echo "$SERVER" > ./server.crt

# Start the app with PM2
pm2 start ./bin/www --name SimpleApp  

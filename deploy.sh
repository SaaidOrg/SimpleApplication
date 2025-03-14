#!/usr/bin/env bash

# Update and install dependencies
sudo apt update && sudo apt install -y nodejs npm

# Install PM2 globally
sudo npm install -g pm2

# Stop the existing PM2 application if running
pm2 stop SimpleApp

# Navigate to the application directory
cd SimpleApplication/

# Install application dependencies
npm install

# Write the private key and certificate to the current directory
echo "$PRIVATE_KEY" > ./privatekey.pem
echo "$SERVER" > ./server.crt

# Verify that the files are written (for debugging purposes)
echo "Private Key:"
cat ./privatekey.pem
echo "Server Certificate:"
cat ./server.crt

# Start the app with PM2
pm2 start ./bin/www --name SimpleApp

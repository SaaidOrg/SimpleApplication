#!/usr/bin/env bash

# Ensure that the system is updated and the necessary packages are installed
sudo apt update && sudo apt install -y nodejs npm

# Install PM2 globally
sudo npm install -g pm2

# Stop any existing process of SimpleApp
pm2 stop SimpleApp

# Copy the private and server keys from the root to the application directory
cp /privatekey.pem SimpleApplication/privatekey.pem
cp /server.crt SimpleApplication/server.crt

# Navigate to the application directory
cd SimpleApplication/

# Install the required dependencies for the application
npm install

# Set appropriate permissions for the copied key files to make them readable
chmod 644 privatekey.pem
chmod 644 server.crt


# If the environment variables are set, write them into the respective files
#echo $PRIVATE_KEY > privatekey.pem
#echo $SERVER > server.crt

# Start the application using PM2
pm2 start ./bin/www --name SimpleApp

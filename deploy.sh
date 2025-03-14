#!/usr/bin/env bash

# Update package lists
sudo apt update 

# Install Node.js and npm separately to avoid conflicts
sudo apt install -y nodejs
sudo apt install -y npm --fix-broken

# Install pm2 globally
sudo npm install -g pm2

# Stop SimpleApp only if it is running
pm2 list | grep -q "SimpleApp" && pm2 stop SimpleApp

# Ensure private key and certificate exist before copying
if [ -f /home/ubuntu/privatekey.pem ]; then
    cp /home/ubuntu/privatekey.pem SimpleApplication/privatekey.pem
    chmod 600 SimpleApplication/privatekey.pem
else
    echo "Error: privatekey.pem not found!"
fi

if [ -f /home/ubuntu/server.crt ]; then
    cp /home/ubuntu/server.crt SimpleApplication/server.crt
    chmod 600 SimpleApplication/server.crt
else
    echo "Error: server.crt not found!"
fi

# Clone or update repository
if [ ! -d "SimpleApplication" ]; then
    git clone https://github.com/SaaidOrg/SimpleApplication.git
fi

cd SimpleApplication/

# Install dependencies
npm install

# Start the application using PM2
pm2 start ./bin/www --name SimpleApp

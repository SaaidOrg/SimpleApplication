#!/usr/bin/env bash

sudo apt update && sudo apt install -y nodejs npm
sudo npm install -g pm2
pm2 stop SimpleApp
cp /home/ubuntu/privatekey.pem SimpleApplication/privatekey.pem
cp /home/ubuntu/server.crt SimpleApplication/server.crt
cd SimpleApplication/
npm install

pm2 start ./bin/www --name SimpleApp
   
#!/usr/bin/env bash
#!/usr/bin/env bash


sudo apt update && sudo apt install -y nodejs npm git


sudo npm install -g pm2

pm2 stop SimpleApp


if [ ! -d "SimpleApplication" ]; then
    git clone https://github.com/SaaidOrg/SimpleApplication.git SimpleApplication
fi

cp /home/ubuntu/privatekey.pem SimpleApplication/privatekey.pem
cp /home/ubuntu/server.crt SimpleApplication/server.crt

cd SimpleApplication/

npm install

chmod 644 privatekey.pem
chmod 644 server.crt

pm2 start ./bin/www --name SimpleApp

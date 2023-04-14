#! /bin/bash

mkdir ./tmp-docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o ./tmp-docker-compose/docker-compose

sudo chmod +x ./tmp-docker-compose/docker-compose
sudo mv ./tmp-docker-compose/docker-compose /usr/local/bin
rm -rf ./tmp-docker-compose/
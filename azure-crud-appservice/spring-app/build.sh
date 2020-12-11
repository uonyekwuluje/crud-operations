#!/bin/bash
echo "Create Database Image"
echo "......................"
cd mysql-setup/
docker build -t mysql57-data .
cd ..
sleep 10
echo "Create Application Image"
echo "........................."
./mvnw clean package -Dmaven.test.skip=true
sleep 2
docker build -t springcrudapp .
sleep 4
docker-compose up

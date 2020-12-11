#!/bin/bash
docker network create crdapp-network

cd mysql-setup/
docker build -t mysql57-data .
sleep 5
#docker run --name appdatabase --network crdapp-network -p 3308:3306 -e MYSQL_ROOT_PASSWORD=mysqlpassword -e MYSQL_USER=appadmin -e MYSQL_PASSWORD=mysqlpassword -e MYSQL_DATABASE=testdb -d mysql57-data
docker run --name appdatabase --network crdapp-network -p 3308:3306 -e MYSQL_ROOT_PASSWORD=mysqlpassword -e MYSQL_USER=appadmin -e MYSQL_PASSWORD=mysqlpassword -d mysql57-data

cd ..
sleep 10
echo "Create Package"
echo "..............."
./mvnw clean package -Dmaven.test.skip=true
sleep 2
docker build -t springcrudapp .
sleep 4
docker run --name springdbapp -p 5000:8080 --network crdapp-network springcrudapp 

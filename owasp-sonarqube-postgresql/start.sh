#!/bin/bash

# install Docker
yum update -y
yum install docker -y
service docker start
usermod -a -G docker ec2-user # update ec2-user with the ssh user name you use.

# pull container images
docker pull owasp/sonarqube
docker pull postgres

# create a Docker network
docker network create mynet

# launch Postgresql contaier
docker run --name sonar-postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d -p 5432:5432 --net mynet postgres

# launch Sonarqube sontainer
docker run --name sonarqube -p 9000:9000 -p 9092:9092 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://sonar-postgres:5432/sonar -d --net mynet owasp/sonarqube


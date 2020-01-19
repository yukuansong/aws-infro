## stand up a sonarqube container and postgresql container, and have sonarqube persist data into the PostgreSQl database
+ owasp sonarqube image: owasp/sonarqube
+ the github: https://github.com/OWASP/sonarqube
```
How to use:

docker pull owasp/sonarqube

docker run -d -p 9000:9000 -p 9092:9092 owasp/sonarqube

Navigate to (on the same machine):

http://localhost:9000
```
+ PostgreSQL container image: postgres
+ postgres container image: https://hub.docker.com/_/postgres



### How easily run Sonarqube and PostgreSQL with Docker Containers?
+ Please check this github post: [Sonarqube and Postgresql](https://gist.github.com/ceduliocezar/b3bf93125024482b5f2f479696842046)
+ Create a Docker Network
```
docker network create mynet
```
+ Create a PostgreSQL Docker Container
```
docker pull postgres
docker run --name sonar-postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d -p 5432:5432 --net mynet postgres
```
+ Create a Sonarqube Docker Conatiner
```
docker pull owasp/sonarqube
docker run --name sonarqube -p 9000:9000 -p 9092:9092 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://sonar-postgres:5432/sonar -d --net mynet owasp/sonarqube
```

+ it works!
```
Navigate to http://localhost:9000
```

## NOTE: please a right EC2 instance type so that it is big enough in term of CPU and memory.
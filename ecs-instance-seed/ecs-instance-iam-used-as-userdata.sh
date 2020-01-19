#!/bin/bash
mkdir -p /etc/ecs
touch /etc/ecs/ecs.config
echo ECS_CLUSTER=Demo >> /etc/ecs/ecs.config

yum update -y
yum install docker -y
service docker start
usermod -a -G docker ec2-user

# install ecs agent
yum install ecs-init -y 
start ecs 
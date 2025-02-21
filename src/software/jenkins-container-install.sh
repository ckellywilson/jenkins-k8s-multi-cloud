#!/bin/bash

# Install Jenkins as a container
echo "Install Jenkins as a container..."
docker run --name jenkins -p 8080:8080 -p 50000:50000 --restart=on-failure -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk17

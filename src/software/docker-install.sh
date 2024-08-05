#!/bin/bash

# Set up the repository
echo "Set up the repository..."
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker Engine
echo "Install Docker Engine..."
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Create the Docker group
echo "Create the Docker group..."
sudo groupadd docker

# Add user to Docker group
echo "Add user to Docker group..."
sudo usermod -aG docker $USER

# Activate the changes to groups
echo "Activate the changes to groups..."
newgrp docker


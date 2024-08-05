#!/bin/sh

# This script is used to deploy software to a server. It is intended to be run
# on the server itself, and it is assumed that the software has already been
# built and packaged.

# Ensure that the script is being run as root
chmod +x ./software/ubuntu-upgrade.sh
chmod +x ./software/microk8s-install.sh
chmod +x ./software/docker-install.sh
chmod +x ./software/kubectl-install.sh
chmod +x ./software/jenkins-container-install.sh

# Deploy Scripts
echo "Deploying software..."
./software/microk8s-install.sh
./software/docker-install.sh
./software/kubectl-install.sh
./software/jenkins-container-install.sh
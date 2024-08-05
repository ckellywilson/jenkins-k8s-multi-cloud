#!/bin/sh

# Install Microk8s
echo "Install Microk8s..."
sudo snap install microk8s --classic

# Add user to microk8s group
echo "Add user to microk8s group..."
sudo usermod -a -G microk8s $USER

# Create local .kube directory
echo "Create local .kube directory..."
mkdir -p $HOME/.kube

# Export Microk8s config to local .kube/config
echo "Export Microk8s config to local .kube/config..."
sudo microk8s config > $HOME/.kube/config
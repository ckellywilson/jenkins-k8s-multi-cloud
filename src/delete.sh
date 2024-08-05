#!/bin/bash

# variables

region="eastus"
domain=""
resource_prefix="jenkins-multi"
RG_NAME=$resource_prefix"-rg"

############################################# SSH Keys and Login #############################################
echo "----------------------- Login ----------------------------"
echo ""

# Navigate to Azure Portal
echo "Navigate to Azure Portal where you will create the resources..."

# Login to Azure
echo "Login to Azure..."
az login --use-device-code

# Delete resource group
echo "Delete resource group " $RG_NAME "..."
az group delete --name $RG_NAME --yes

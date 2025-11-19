#!/bin/bash

# -------- Variables --------
LOCATION="Central India"
RG_NAME="BackendResourceGroup"
STORAGE_ACCOUNT="backendstorageacc$RANDOM"
CONTAINER_NAME="backendcontainer"

# -------- Commands --------
az group create -n "$RG_NAME" -l "$LOCATION"

az storage account create \
  -n "$STORAGE_ACCOUNT" \
  -g "$RG_NAME" \
  -l "$LOCATION" \
  --sku Standard_LRS

CONN=$(az storage account show-connection-string -n "$STORAGE_ACCOUNT" -g "$RG_NAME" -o tsv)

az storage container create \
  --name "$CONTAINER_NAME" \
  --connection-string "$CONN"

echo "✔ RG, Storage account, and container created successfully."

#!/bin/bash

# Script to install Helm on Alpine Linux

set -e

# Function to print messages
log() {
    echo "[INFO] $1"
}

# Update the package index
log "Updating package index..."
sudo apk update

# Install curl if not installed
log "Installing curl..."
sudo apk add --no-cache curl

# Download Helm installation script
log "Downloading Helm installation script..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

# Make the script executable
log "Making the script executable..."
chmod +x get_helm.sh

# Run the Helm installation script
log "Installing Helm..."
./get_helm.sh

# Verify Helm installation
if helm version > /dev/null 2>&1; then
    log "Helm installed successfully!"
    helm version
else
    echo "[ERROR] Helm installation failed."
    exit 1
fi

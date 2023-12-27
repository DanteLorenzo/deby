#!/usr/bin/env bash

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to log messages in green
log() {
  echo -e "${GREEN}[INFO] $1${NC}"
}

# Function to log error messages in red
log_error() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# Install Docker
log "Installing Docker..."
curl -sSl https://get.docker.com/ | bash

# Check if installation was successful
if [ $? -eq 0 ]; then
  log "Docker installation completed successfully."

  # Add the user to the docker group
  log "Adding user to the docker group..."
  sudo usermod -aG docker $USER

  # Switch to the docker group
  log "Switching to the docker group..."
  newgrp docker

  log "User added to the docker group. Please restart your session or run 'newgrp docker' to apply changes."
else
  log_error "Docker installation failed. Please check the installation process."
fi

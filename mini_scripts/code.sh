#!/usr/bin/env bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Define variables
download_url='https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
download_path=/tmp/vscode.deb

# Function to log messages in green
log() {
  echo -e "${GREEN}[INFO] $1${NC}"
}

# Function to log error messages in red
log_error() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# Function to log warnings in yellow
log_warning() {
  echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Download Visual Studio Code
log "Downloading Visual Studio Code..."
wget -O "$download_path" "$download_url"

# Check if download was successful
if [ $? -eq 0 ]; then
  log "Download completed successfully."

  # Install Visual Studio Code
  log "Installing Visual Studio Code..."
  sudo dpkg -i "$download_path"

  # Check if installation was successful
  if [ $? -eq 0 ]; then
    log "Installation completed successfully."

    # Clean up downloaded file
    log "Cleaning up..."
    rm "$download_path"
    log "Clean up completed."
  else
    log_error "Installation failed. Please check the installation process."
  fi
else
  log_error "Download failed. Please check the download URL and try again."
  log_warning "Make sure you have an active internet connection."
fi

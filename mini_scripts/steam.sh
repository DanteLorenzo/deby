#!/usr/bin/env bash

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to log messages in green
log_info() {
  echo -e "${CYAN}[INFO] $1${NC}"
}

# Function to log success messages in green
log_success() {
  echo -e "${GREEN}[SUCCESS] $1${NC}"
}

# Function to log error messages in red
log_error() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# Download Steam
log_info "Downloading Steam..."
wget -O /tmp/steam.deb 'https://cdn.akamai.steamstatic.com/client/installer/steam.deb'

# Check if download was successful
if [ $? -eq 0 ]; then
  log_success "Download completed successfully."

  # Install Steam
  log_info "Installing Steam..."
  sudo dpkg -i /tmp/steam.deb

  # Check if installation was successful
  if [ $? -eq 0 ]; then
    log_success "Installation completed successfully."

    # Clean up downloaded file
    log_info "Cleaning up..."
    rm /tmp/steam.deb
    log_success "Clean up completed."
  else
    log_error "Installation failed. Please check the installation process."
  fi
else
  log_error "Download failed. Please check the download URL and try again."
fi

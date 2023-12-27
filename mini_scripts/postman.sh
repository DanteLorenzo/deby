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

# Download and install Postman
log_info "Downloading Postman..."
wget -O /tmp/postman.tar.gz "https://dl.pstmn.io/download/latest/linux_64"

# Check if download was successful
if [ $? -eq 0 ]; then
  log_success "Download completed successfully."

  # Extract and install Postman
  log_info "Installing Postman..."
  sudo tar -C /opt -xzf /tmp/postman.tar.gz

  # Check if installation was successful
  if [ $? -eq 0 ]; then
    log_success "Postman installed successfully."

    # Copy desktop file to applications
    log_info "Copying Postman.desktop to applications..."
    cp ./dotfiles/postman/Postman.desktop ~/.local/share/applications/Postman.desktop

    # Clean up downloaded file
    log_info "Cleaning up..."
    rm /tmp/postman.tar.gz

    log_success "Postman setup completed successfully."
  else
    log_error "Failed to install Postman. Check for errors above."
  fi
else
  log_error "Download failed. Check the download URL and try again."
fi

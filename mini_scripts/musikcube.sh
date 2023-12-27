#!/usr/bin/env bash

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to log messages in cyan
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

# Display a message before starting the installation
log_info "Downloading Musikcube..."

# Download Musikcube
wget -O /tmp/musikcube.deb https://github.com/clangen/musikcube/releases/download/3.0.2/musikcube_3.0.2_linux_x86_64.deb

# Check if download was successful
if [ $? -eq 0 ]; then
  log_success "Musikcube downloaded successfully."

  # Install Musikcube
  log_info "Installing Musikcube..."
  sudo dpkg -i /tmp/musikcube.deb

  # Check if installation was successful
  if [ $? -eq 0 ]; then
    log_success "Musikcube installed successfully."

    # Clean up downloaded file
    log_info "Cleaning up..."
    rm /tmp/musikcube.deb

    log_success "Clean up completed."
  else
    log_error "Failed to install Musikcube. Check for errors above."
  fi
else
  log_error "Failed to download Musikcube. Check the download URL and try again."
fi

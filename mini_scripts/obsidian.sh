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

# Install htmlq using Cargo
log_info "Installing htmlq..."
cargo install htmlq

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "htmlq installed successfully."

  # Download Obsidian Debian package to /tmp
  log_info "Downloading Obsidian Debian package..."
  obsidian_deb_url=$(curl --silent https://obsidian.md/download | htmlq --attribute href a | grep .deb)
  wget -O /tmp/obsidian.deb "$obsidian_deb_url"

  # Check if download was successful
  if [ $? -eq 0 ]; then
    log_success "Obsidian Debian package downloaded successfully."

    # Install Obsidian
    log_info "Installing Obsidian..."
    sudo dpkg -i /tmp/obsidian.deb

    # Check if installation was successful
    if [ $? -eq 0 ]; then
      log_success "Obsidian installed successfully."

      # Clean up downloaded file
      log_info "Cleaning up..."
      rm /tmp/obsidian.deb

      log_success "Clean up completed."
    else
      log_error "Failed to install Obsidian. Check for errors above."
    fi
  else
    log_error "Failed to download Obsidian Debian package. Check for errors above."
  fi
else
  log_error "Failed to install htmlq. Check for errors above."
fi

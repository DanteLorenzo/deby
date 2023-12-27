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

# Backup the existing sources.list file
log_info "Backing up the existing sources.list file..."
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

# Copy the new sources.list file from dotfiles directory
log_info "Copying the new sources.list file..."
sudo cp ./dotfiles/apt/sources.list /etc/apt/

# Update the package repository information
log_info "Updating package repository information..."
sudo apt update -y

# Check if the update was successful
if [ $? -eq 0 ]; then
    log_success "Package repository information updated successfully."
else
    log_error "Failed to update package repository information. Check for errors above."
fi

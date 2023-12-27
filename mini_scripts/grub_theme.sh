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

# Display a message before starting the setup
log_info "Setting up GRUB themes and configurations..."

# Create directories for GRUB themes
log_info "Creating directories for GRUB themes..."
sudo mkdir -p /boot/grub/themes/diana

# Copy Terminus font to GRUB fonts directory
log_info "Copying Terminus font to GRUB fonts directory..."
sudo cp ./fonts/Terminus-32.pf2 /boot/grub/fonts/

# Copy GRUB theme configuration
log_info "Copying GRUB theme configuration..."
sudo cp ./dotfiles/grub/theme.txt /boot/grub/themes/diana/

# Copy GRUB default configuration
log_info "Copying GRUB default configuration..."
sudo cp ./dotfiles/grub/grub /etc/default/grub

# Update GRUB
log_info "Updating GRUB..."
sudo update-grub

# Check if the update was successful
if [ $? -eq 0 ]; then
    log_success "GRUB configuration updated successfully."
else
    log_error "Failed to update GRUB configuration. Check for errors above."
fi

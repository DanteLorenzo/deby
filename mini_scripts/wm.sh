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

# Install necessary packages
log_info "Installing necessary packages..."
sudo apt update
sudo apt install -y \
    bspwm \
    sxhkd \
    polybar \
    kitty \
    xserver-xorg-video-qxl \
    spice-vdagent \
    plocate \
    xfce4-terminal \
    feh \
    dmenu \
    picom \
    xorg \
    thunar

# Check if the installation was successful
if [ $? -eq 0 ]; then
  log_success "Package installation completed successfully."
else
  log_error "Failed to install packages. Check for errors above."
  exit 1
fi

# Create necessary directories
log_info "Creating necessary directories..."
mkdir -p ~/.config/{bspwm,sxhkd,picom}

# Copy configuration files
log_info "Copying configuration files..."
cp ./dotfiles/bspwm/bspwmrc ~/.config/bspwm/
cp ./dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/
cp ./dotfiles/picom/picom.conf ~/.config/picom/
cp ./dotfiles/xorg/.xinitrc ~/

log_success "Setup completed successfully."

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

# Install tmux
log_info "Installing tmux..."
sudo apt install -y tmux

# Check if the installation was successful
if [ $? -eq 0 ]; then
  log_success "tmux installed successfully."

  # Configure tmux
  log_info "Configuring tmux..."
  tmux_config_dir=~/.config/tmux

  # Create the tmux config directory if it doesn't exist
  if [ ! -d "$tmux_config_dir" ]; then
    log_info "Creating tmux config directory..."
    mkdir -p "$tmux_config_dir"
  fi

  # Copy the tmux configuration file
  log_info "Copying tmux configuration file..."
  cp ./dotfiles/tmux/tmux.conf "$tmux_config_dir/"

  log_success "tmux configuration completed successfully."
else
  log_error "Failed to install tmux. Check for errors above."
fi

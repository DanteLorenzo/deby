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

# Install htmlq using Cargo
log_info "Installing htmlq..."
cargo install htmlq

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "htmlq installed successfully."

  # Download and install the latest version of Go
  log_info "Downloading and installing the latest version of Go..."
  go_url="https://go.dev/$(curl --silent https://go.dev/dl/ | htmlq --attribute href a | grep linux-amd64.tar.gz | awk 'NR==1')"
  wget -O ~/Downloads/golang.tar.gz "$go_url"
  sudo tar -C /usr/local -xzf ~/Downloads/golang.tar.gz

  # Update PATH in shell configuration files
  log_info "Updating PATH in shell configuration files..."
  echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
  echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

  # Clean up downloaded file
  log_info "Cleaning up..."
  rm ~/Downloads/golang.tar.gz

  log_success "Go installed and configured successfully."
else
  log_error "Failed to install htmlq. Check for errors above."
fi

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

# Display a message before starting the upgrade process
log_info "Initiating system upgrade..."

# Run the system upgrade
sudo apt upgrade -y

# Check if the upgrade was successful
if [ $? -eq 0 ]; then
    log_success "System upgrade completed successfully."
else
    log_error "Failed to upgrade the system. Check for errors above."
fi

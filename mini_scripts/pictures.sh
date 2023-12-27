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

# Copy contents of ./pictures/ to ~/Pictures/
log_info "Copying contents of ./pictures/ to ~/Pictures/..."
cp -r ./pictures/* ~/Pictures/

# Check if the copy operation was successful
if [ $? -eq 0 ]; then
  log_success "Copy operation completed successfully."
else
  log_error "Failed to copy contents. Check for errors above."
fi

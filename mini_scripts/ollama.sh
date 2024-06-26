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

# Install Ollama
log_info "Installing Ollama..."
curl https://ollama.ai/install.sh | sh

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "Ollama installed successfully."

  # Pull a specific version using Ollama
  log_info "Pulling a specific version using Ollama..."
  ollama pull codestral

  # Check if the pull operation was successful
  if [ $? -eq 0 ]; then
    log_success "Pull operation completed successfully."
  else
    log_error "Failed to pull a specific version. Check for errors above."
  fi
else
  log_error "Failed to install Ollama. Check for errors above."
fi

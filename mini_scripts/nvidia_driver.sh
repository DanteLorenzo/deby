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
log_info "Installing NVIDIA System Management Interface (nvidia-smi)..."

# Install nvidia-smi
sudo apt install -y nvidia-smi

# Install NVIDIA CUDA Toolkit
log_info "Installing NVIDIA CUDA Toolkit..."
sudo apt install -y nvidia-cuda-toolkit

# Check if the installation was successful
if [ $? -eq 0 ]; then
    log_success "NVIDIA System Management Interface (nvidia-smi) and CUDA Toolkit installed successfully."
else
    log_error "Failed to install NVIDIA System Management Interface (nvidia-smi). Check for errors above."
fi

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

# Install QEMU and libvirt components
log_info "Installing QEMU and libvirt components..."
sudo apt install -y qemu-utils qemu-kvm libvirt-daemon-system libvirt-clients virt-manager bridge-utils qemu virt-viewer spice-vdagent

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "QEMU and libvirt components installed successfully."

  # Create libvirt user groups
  log_info "Creating libvirt user groups..."
  sudo useradd -g $USER libvirt
  sudo useradd -g $USER libvirt-kvm

  # Enable and start libvirtd service
  log_info "Enabling and starting libvirtd service..."
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
  sudo virsh net-autostart default
  sudo virsh net-start default
  log_success "libvirtd service enabled and started successfully."
else
  log_error "Failed to install QEMU and libvirt components. Check for errors above."
fi

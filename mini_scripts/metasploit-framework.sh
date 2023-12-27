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

# Adding Metasploit GPG key
log_info "Adding Metasploit GPG key..."
curl -fsSL https://apt.metasploit.com/metasploit-framework.gpg.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/metasploit.gpg > /dev/null

# Adding Metasploit repository
log_info "Adding Metasploit repository..."
echo "deb [signed-by=/usr/share/keyrings/metasploit.gpg] https://apt.metasploit.com/ buster main" | sudo tee /etc/apt/sources.list.d/metasploit.list

# Update package index
log_info "Updating package index..."
sudo apt update

# Install Metasploit Framework
log_info "Installing Metasploit Framework..."
sudo apt install metasploit-framework

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "Metasploit Framework installed successfully."
else
  log_error "Failed to install Metasploit Framework. Check for errors above."
fi

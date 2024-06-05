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

# Install curl
log_info "Installing curl..."
sudo apt install -y curl

# Check if curl installation was successful
if [ $? -eq 0 ]; then
  log_success "curl installed successfully."
  
  # Download Brave's signing key
  log_info "Downloading Brave's signing key..."
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

  # Check if key download was successful
  if [ $? -eq 0 ]; then
    log_success "Brave's signing key downloaded successfully."
    
    # Add Brave's repository to the sources list
    log_info "Adding Brave's repository to the sources list..."
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    # Check if repository addition was successful
    if [ $? -eq 0 ]; then
      log_success "Brave's repository added successfully."
      
      # Update the package list
      log_info "Updating package list..."
      sudo apt update

      # Check if update was successful
      if [ $? -eq 0 ]; then
        log_success "Package list updated successfully."
        
        # Install Brave browser
        log_info "Installing Brave browser..."
        sudo apt install -y brave-browser

        # Check if Brave installation was successful
        if [ $? -eq 0 ]; then
          log_success "Brave browser installed successfully."
        else
          log_error "Failed to install Brave browser. Check for errors above."
        fi
      else
        log_error "Failed to update package list. Check for errors above."
      fi
    else
      log_error "Failed to add Brave's repository. Check for errors above."
    fi
  else
    log_error "Failed to download Brave's signing key. Check for errors above."
  fi
else
  log_error "Failed to install curl. Check for errors above."
fi

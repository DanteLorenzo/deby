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

# Determine the distribution version
distro=$(if echo " una vanessa focal jammy bullseye vera uma" | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

# Adding Librewolf GPG key
log_info "Adding Librewolf GPG key..."
wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

# Adding Librewolf repository
log_info "Adding Librewolf repository..."
sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

# Update package index
log_info "Updating package index..."
sudo apt update -y

# Install Librewolf
log_info "Installing Librewolf..."
sudo apt install -y librewolf

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "Librewolf installed successfully."
else
  log_error "Failed to install Librewolf. Check for errors above."
fi

# Removing unnecessary files
log_info "Removing unnecessary files..."
sudo rm -f \
    /etc/apt/sources.list.d/librewolf.sources \
    /usr/share/keyrings/librewolf.gpg \
    /etc/apt/preferences.d/librewolf.pref \
    /etc/apt/sources.list.d/home_bgstack15_aftermozilla.sources \
    /etc/apt/keyrings/home_bgstack15_aftermozilla.gpg \
    /etc/apt/sources.list.d/librewolf.list \
    /etc/apt/trusted.gpg.d/librewolf.gpg \
    /etc/apt/sources.list.d/home:bgstack15:aftermozilla.list \
    /etc/apt/trusted.gpg.d/home_bgstack15_aftermozilla.gpg

log_success "Cleanup completed."

#!/usr/bin/env bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Define variables
download_url='https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp'
download_path='/usr/bin/yt-dlp'

# Function to log messages in green
log() {
  echo -e "${GREEN}[INFO] $1${NC}"
}

# Function to log error messages in red
log_error() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# Function to log warnings in yellow
log_warning() {
  echo -e "${YELLOW}[WARNING] $1${NC}"
}

# Download yt-dlp
log "Downloading yt-dlp..."
sudo wget -O "$download_path" "$download_url"

# Check if download was successful
if [ $? -eq 0 ]; then
  log "Download completed successfully."

  sudo chmod +x "$download_path"

  # Check if installation was successful
  if [ $? -eq 0 ]; then
    log "Installation completed successfully."

  else
    log_error "Installation failed. Please check the installation process."
  fi
else
  log_error "Download failed. Please check the download URL and try again."
  log_warning "Make sure you have an active internet connection."
fi

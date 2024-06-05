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

log_info "Updating system..."
sudo apt update -y

# Execute mini-scripts
mini_scripts=(
  upgrade_system.sh
  install_packages.sh
  nvidia_driver.sh
  rust.sh
  golang.sh
  code.sh
  docker.sh
  postman.sh
  librewolf.sh
  brave.sh
  metasploit-framework.sh
  musikcube.sh
  qemu_kvm.sh
  obsidian.sh
  tmux.sh
  ohmyzsh.sh
  ollama.sh
  steam.sh
  discord.sh
  yt-dlp.sh
  pictures.sh
)

for script in "${mini_scripts[@]}"; do
  log_info "Running $script..."
  ./mini_scripts/$script

  # Check if the script execution was successful
  if [ $? -eq 0 ]; then
    log_success "$script completed successfully."
  else
    log_error "Failed to run $script. Check for errors above."
  fi
done

log_success "All mini-scripts executed successfully."

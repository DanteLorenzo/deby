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

# Install Oh My Zsh
log_info "Installing Oh My Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Check if installation was successful
if [ $? -eq 0 ]; then
  log_success "Oh My Zsh installed successfully."

  # Clone zsh-autosuggestions plugin
  log_info "Cloning zsh-autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Clone zsh-syntax-highlighting plugin
  log_info "Cloning zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # Copy custom .zshrc file
  log_info "Copying custom .zshrc file..."
  cp ./dotfiles/zsh/.zshrc ~/

  log_success "Setup completed successfully."
else
  log_error "Failed to install Oh My Zsh. Check for errors above."
fi

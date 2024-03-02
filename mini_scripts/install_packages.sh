#!/usr/bin/env bash

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to log messages in green
log() {
  echo -e "${GREEN}[INFO] $1${NC}"
}

# Function to log error messages in red
log_error() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# List of packages to install
packages=(
    wget
    curl
    gnupg
    lsb-release
    apt-transport-https
    ca-certificates
    wine
    net-tools
    macchanger
    gobuster
    hashcat
    ansible
    remmina
    htop
    btop
    etherwake
    software-properties-common
    pkg-config
    libssl-dev
    gimp
    gparted
    netdiscover
    ncat
    nmap
    sqlmap
    openssh-client
    wireshark
    gnome-tweaks
    python3-pip
    golang
    timeshift
    podman
    resolvconf
    wireguard
    git
    clang
    cmake
    ninja-build
    hwinfo
    crunch
    hydra
    iftop
    john
    zsh
    clamav
    chiaki
    deluge
    fcrackzip
    ferm
    hping3
    nikto
    nload
    openvpn
    ffmpeg
    haruna
    simplescreenrecorder
)

# Install packages
log "Installing packages..."
sudo apt update
sudo apt install -y "${packages[@]}"

# Check if installation was successful
if [ $? -eq 0 ]; then
  log "Package installation completed successfully."
else
  log_error "Package installation failed. Please check the installation process."
fi

# Cleanup
log "Cleaning up..."
sudo apt autoremove -y
sudo apt clean

log "Cleanup completed."

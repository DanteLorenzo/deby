#!/bin/bash

# Define the directory to be added to the PATH
directory_to_add="/usr/sbin"

# Check if the directory is already in the PATH
if [[ ":$PATH:" != *":$directory_to_add:"* ]]; then
  # Append the directory to the PATH in the user's .bashrc
  echo 'export PATH=$PATH:'"$directory_to_add"'' >> "$HOME"/.bashrc
  echo "Directory added to PATH. Restart your shell or run 'source ~/.bashrc' to apply changes."
else
  echo "Directory is already in the PATH. No changes made."
fi

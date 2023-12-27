#!/usr/bin/env bash

# Set the UID for which sudo privileges will be granted
uid=1000
sudoers_dir="/etc/sudoers.d"

# Get the username associated with the UID
username=$(getent passwd "$uid" | cut -d: -f1)

# Display information about the user for whom sudo privileges will be configured
echo -e "\e[94m[INFO]\e[0m Configuring sudo privileges for user: \e[96m${username}\e[0m"

# Check if the user with the specified UID exists
if [ -z "$username" ]; then
    echo -e "\e[31m[ERROR]\e[0m User with UID $uid not found. Exiting."
    exit 1
fi

# Define the path for the sudoers file
filename="${sudoers_dir}/${username}"

# Check if the sudoers file already exists
if [ -e "$filename" ]; then
    echo -e "\e[31m[ERROR]\e[0m Sudoers file \e[96m${filename}\e[0m already exists. Exiting."
    exit 1
fi

# Create the sudoers file with the required content
echo "${username}    ALL=(ALL:ALL) ALL" | sudo tee "${filename}" > /dev/null

# Check if the creation of the sudoers file was successful
if [ $? -eq 0 ]; then
    echo -e "\e[32m[SUCCESS]\e[0m User \e[96m${username}\e[0m added to sudo successfully."
    echo -e "\e[32m[SUCCESS]\e[0m Sudoers file \e[96m${filename}\e[0m created successfully."
else
    echo -e "\e[31m[ERROR]\e[0m Failed to add \e[96m${username}\e[0m to sudo."
    echo -e "\e[31m[ERROR]\e[0m Failed to create sudoers file \e[96m${filename}\e[0m."
fi





ADD TO PATH /usr/sbin
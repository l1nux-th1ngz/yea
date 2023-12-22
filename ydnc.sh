#!/bin/bash

# List of packages to install
packages=("package1" "package2" "package3" "package4" "package5" "package6" "package7" "package8")

# Install packages
for package in "${packages[@]}"; do
    yay -S --noconfirm "$package"
    
    # Assuming the configuration file is at /etc/$package/$package.conf
    if [ -f "/etc/$package/$package.conf" ]; then
        cp "/etc/$package/$package.conf" "$HOME/.config/$package.conf"
    fi
done

# Function to update the system
update_system() {
    yay -Syu
}

# Function to update the package database
update_db() {
    yay -Sy
}

# Create buttons for the update functions
echo "Press 1 to update the system, or 2 to update the package database:"
read -r option
if [ "$option" -eq 1 ]; then
    update_system
elif [ "$option" -eq 2 ]; then
    update_db
else
    echo "Invalid option"
fi

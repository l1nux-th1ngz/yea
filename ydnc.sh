#!/bin/bash

# Function to install packages
install_packages() {
    # Prompt user to enter packages
    packages=$(zenity --forms --title="Install Packages" --text="Enter the names of the packages you want to install:" --add-entry="Package 1" --add-entry="Package 2" --add-entry="Package 3" --add-entry="Package 4" --add-entry="Package 5" --add-entry="Package 6" --add-entry="Package 7" --add-entry="Package 8")
    
    # Convert the packages string to an array
    IFS='|' read -ra packages_array <<< "$packages"
    
    # Install each package
    for package in "${packages_array[@]}"; do
        if [ ! -z "$package" ]; then
            yay -S --noconfirm "$package" > /dev/null 2>&1
            zenity --info --text="Package $package installed successfully."
        fi
    done
}

# Main script
install_packages

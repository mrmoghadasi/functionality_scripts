#!/bin/bash

# URL of the script in the GitHub repository
SCRIPT_URL="https://raw.githubusercontent.com/mrmoghadasi/functionality_scripts/main/docker/easy_install.sh"

# Download the script
echo "Downloading the script..."
curl -o /tmp/easy_install.sh -L "$SCRIPT_URL"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Script downloaded successfully."

    # Make the script executable
    chmod +x /tmp/easy_install.sh

    # Run the script
    echo "Running the script..."
    /tmp/easy_install.sh
else
    echo "Failed to download the script. Please check your internet connection or the URL."
    exit 1
fi

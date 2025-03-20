#!/bin/bash

# Define variables
SCRIPT_URL="https://raw.githubusercontent.com/mrmoghadasi/functionality_scripts/main/close_port/close_port.ssh"
SCRIPT_PATH="$HOME/close_port.sh"
ALIAS_NAME="closeport"
BASHRC_PATH="$HOME/.bashrc"


echo "Downloading the script..."
curl -o "$SCRIPT_PATH" -L "$SCRIPT_URL"


# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Script downloaded successfully"

    
    chmod +x "$SCRIPT_PATH"
    echo "Make the script executable"

    # Add alias to .bashrc if not already present
    grep -qxF "alias $ALIAS_NAME='$SCRIPT_PATH'" "$BASHRC_PATH" || echo "alias $ALIAS_NAME='$SCRIPT_PATH'" >> "$BASHRC_PATH" 
else
    echo "Failed to download the script. Please check your internet connection or the URL."
    exit 1
fi

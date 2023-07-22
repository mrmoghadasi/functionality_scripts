#!/bin/bash

# Function to add IP rules
add_ip_rule() {
    local action="$1"
    local ip_address="$2"
    local port="$3"
    
    if [ -n "$port" ]; then
        ufw "$action" from "$ip_address" to any port "$port"
    else
        ufw "$action" from "$ip_address" to any
    fi
}

# Function to add port rules
add_port_rule() {
    local action="$1"
    local port="$2"
    
    ufw "$action" "$port"
}

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root!"
    exit 1
fi

# Check if the IP rules file is provided as an argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <ip_rules_file> [port_rules_file]"
    exit 1
fi

ip_rules_file="$1"
port_rules_file="$2"

# Check if UFW is installed
if ! command -v ufw &> /dev/null; then
    echo "UFW is not installed. Please install UFW and try again."
    exit 1
else
# UFW disable and reset
    ufw disable
    echo "UFW disabe !"
    echo "y" | sudo ufw reset
    echo "UFW reset !"
fi


# Process IP rules file
if [ -f "$ip_rules_file" ]; then
    while read -r line; do
        action=$(echo "$line" | awk '{print $1}')
        ip_address=$(echo "$line" | awk '{print $2}')
        port=$(echo "$line" | awk '{print $3}')
        
        if [ "$action" == "allow" ]; then
            add_ip_rule "allow" "$ip_address" "$port"
        elif [ "$action" == "deny" ]; then
            add_ip_rule "deny" "$ip_address" "$port"
        else
            echo "Invalid action specified in the IP rules file: $action"
        fi
    done < "$ip_rules_file"
else
    echo "IP rules file not found: $ip_rules_file"
fi

# Process port rules file
if [ -f "$port_rules_file" ]; then
    while read -r line; do
        action=$(echo "$line" | awk '{print $1}')
        port=$(echo "$line" | awk '{print $2}')
        
        if [ -n "$port" ]; then
            if [ "$action" == "allow" ]; then
                add_port_rule "allow" "$port"
            elif [ "$action" == "deny" ]; then
                add_port_rule "deny" "$port"
            else
                echo "Invalid action specified in the port rules file: $action"
            fi
        else
            echo "Port not specified in the port rules file: $line"
        fi
    done < "$port_rules_file"
else
    echo "Port rules file not found: $port_rules_file"
fi

# set default rules: deny all incoming traffic, allow all outgoing traffic
ufw default deny incoming
ufw default allow outgoing

# Enable UFW
echo "y" | sudo ufw enable

#List all firewall rules
sudo ufw status numbered verbose

# Reload UFW to apply the changes
#ufw reload
#echo "Firewall rules have been updated."

#!/bin/bash

# List of hosts to monitor
HOSTS=("IP1" "IP2" "IP3")  # Replace with your own IPs or hostnames
LOGFILE="network_monitor.log"

# Function to check network connectivity
check_connectivity() {
    for HOST in "${HOSTS[@]}"; do
        if ping -c 1 "$HOST" &> /dev/null; then
            echo "$(date): $HOST is UP" >> "$LOGFILE"
        else
            echo "$(date): $HOST is DOWN" >> "$LOGFILE"
        fi
    done
}

# Main loop to monitor every 5 seconds
while true; do
    check_connectivity
    sleep 5  # Adjust the sleep duration as needed
done
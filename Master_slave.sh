#!/bin/bash

# Define the slave nodes
SLAVE1="user@slave1_ip"
SLAVE2="user@slave2_ip"

# Function to execute a command on a slave
execute_command() {
    local slave=$1
    local command=$2
    echo "Executing on $slave: $command"
    ssh "$slave" "$command"
}

# Main menu for user interaction
while true; do
    echo "=============================="
    echo "Master Node Control Menu"
    echo "=============================="
    echo "1. Execute command on Slave 1"
    echo "2. Execute command on Slave 2"
    echo "3. Execute command on both slaves"
    echo "4. Exit"
    read -p "Choose an option [1-4]: " option

    case $option in
        1)
            read -p "Enter command for Slave 1: " cmd1
            execute_command "$SLAVE1" "$cmd1"
            ;;
        2)
            read -p "Enter command for Slave 2: " cmd2
            execute_command "$SLAVE2" "$cmd2"
            ;;
        3)
            read -p "Enter command for both slaves: " cmd_all
            execute_command "$SLAVE1" "$cmd_all"
            execute_command "$SLAVE2" "$cmd_all"
            ;;
        4)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
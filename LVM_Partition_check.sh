#!/bin/bash

# Display a header for clarity
echo "======================="
echo "LVM Partition and Disk Space Monitor"
echo "======================="

# Check if LVM is installed
if ! command -v lvm &> /dev/null; then
    echo "LVM is not installed. Please install LVM to use this script."
    exit 1
fi

# Display LVM information
echo -e "\nLogical Volumes:"
lvdisplay

# Display disk space usage for all mounted filesystems
echo -e "\nDisk Space Usage:"
df -hP | column -t

# Display physical volumes
echo -e "\nPhysical Volumes:"
pvdisplay

# Display volume group information
echo -e "\nVolume Groups:"
vgdisplay

echo -e "\n======================="
echo "Monitoring Complete"
echo "======================="
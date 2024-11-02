#!/bin/bash

# Display a header for clarity
echo "======================="
echo "Server Resource Monitor"
echo "======================="

# Display memory usage using vmstat
echo -e "\nMemory Usage (vmstat):"
vmstat -s -S M

# Display top 5 processes by CPU usage using ps
echo -e "\nTop 5 CPU consuming processes (ps):"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Display current CPU utilization
echo -e "\nCurrent CPU Utilization:"
mpstat | grep "all"

# Display total memory and swap usage
echo -e "\nTotal Memory and Swap Usage:"
cat /proc/meminfo | grep -E 'MemTotal|MemFree|SwapTotal|SwapFree'

echo -e "\n======================="
echo "Resource Monitoring Complete"
echo "======================="
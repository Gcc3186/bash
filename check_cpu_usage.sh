#!/bin/bash

# Function to get the current CPU usage
get_cpu_usage() {
  echo "CPU Usage: $(top -bn1 | awk '/Cpu\(s\)/ { print $2 }')"
}

# Function to get the current memory usage
get_memory_usage() {
  echo "Memory Usage: $(free -m | awk '/Mem/ { printf("%.2f%"), $3/$2*100 }')"
}

# Function to get the current disk usage
get_disk_usage() {
  echo "Disk Usage: $(df -h | awk '/\/$/ { printf("%s"), $5 }')"
}

# Call the functions to get the usage information
echo "--- System Usage ---"
get_cpu_usage
get_memory_usage
get_disk_usage


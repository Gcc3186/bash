#!/bin/bash

# Function to get the average CPU usage over the last minute
get_cpu_usage() {
  cpu_usage=$(top -bn2 | awk '/Cpu\(s\)/ { cpu = $2 } END { print cpu }')
  echo "Average CPU Usage over the last minute: $cpu_usage%"
}

# Function to get the average memory usage over the last minute
get_memory_usage() {
  memory_usage=$(free -m | awk '/Mem/ { printf("%.2f%"), $3/$2*100 }')
  echo "Average Memory Usage over the last minute: $memory_usage"
}

# Function to get the average disk usage over the last minute
get_disk_usage() {
  disk_usage=$(df -h | awk '/\/$/ { printf("%s"), $5 }')
  echo "Average Disk Usage over the last minute: $disk_usage"
}

# Call the functions to get the usage information
echo "--- System Usage ---"
get_cpu_usage
get_memory_usage
get_disk_usage


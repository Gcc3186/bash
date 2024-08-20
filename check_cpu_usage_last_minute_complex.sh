#!/bin/bash

# Function to get the average CPU usage over a given interval of time
get_cpu_usage() {
  interval=$1
  cpu_usage=$(top -bn2 -d $interval | awk '/Cpu\(s\)/ { cpu = $2 } END { print cpu }')
  echo "Average CPU Usage over the last $interval seconds: $cpu_usage%"
  echo "Top 3 processes using the most CPU:"
  top -bn1 -d $interval | awk 'NR>7{print $0}' | sort -k9nr | head -3
}

# Function to get the average memory usage over a given interval of time
get_memory_usage() {
  interval=$1
  memory_usage=$(free -m | awk '/Mem/ { printf("%.2f%"), $3/$2*100 }')
  echo "Average Memory Usage over the last $interval seconds: $memory_usage"
  echo "Top 3 processes using the most memory:"
  top -bn1 -d $interval | awk 'NR>7{print $0}' | sort -k10nr | head -3
}

# Function to get the average disk usage over a given interval of time
get_disk_usage() {
  disk_usage=$(df -h | awk '/\/$/ { printf("%s"), $5 }')
  echo "Average Disk Usage over the last $interval seconds: $disk_usage"
}

# Call the functions to get the usage information
echo "--- System Usage ---"
interval=60
get_cpu_usage $interval
get_memory_usage $interval
get_disk_usage


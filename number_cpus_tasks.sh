for i in $(seq 0 $(($(grep -c ^processor /proc/cpuinfo) - 1))); do
  cpu_info=$(grep "^cpu${i}" /proc/stat)
  user_mode=$(echo "$cpu_info" | awk '{print $2}')
  nice_mode=$(echo "$cpu_info" | awk '{print $3}')
  system_mode=$(echo "$cpu_info" | awk '{print $4}')
  idle_mode=$(echo "$cpu_info" | awk '{print $5}')
  iowait_mode=$(echo "$cpu_info" | awk '{print $6}')
  irq_mode=$(echo "$cpu_info" | awk '{print $7}')
  softirq_mode=$(echo "$cpu_info" | awk '{print $8}')
  total_time=$(($user_mode + $nice_mode + $system_mode + $idle_mode + $iowait_mode + $irq_mode + $softirq_mode))
  utilization=$((100 * ($total_time - $idle_mode) / $total_time))
  echo "CPU ${i}: utilization ${utilization}%"
done


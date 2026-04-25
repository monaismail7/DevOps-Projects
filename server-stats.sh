#!/bin/bash

echo "===== Server Performance Stats ====="

# CPU Usage
echo "---- CPU Usage ----"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

# Memory Usage
echo "---- Memory Usage ----"
free -m | awk 'NR==2{
    total=$2;
    used=$3;
    free=$4;
    printf "Total: %s MB\nUsed: %s MB\nFree: %s MB\nUsage: %.2f%%\n", total, used, free, used/total*100
}'

# Disk Usage
echo "---- Disk Usage ----"
df -h / | awk 'NR==2{
    printf "Total: %s\nUsed: %s\nFree: %s\nUsage: %s\n", $2, $3, $4, $5
}'

# Top 5 processes by CPU
echo "---- Top 5 Processes by CPU ----"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory
echo "---- Top 5 Processes by Memory ----"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
# Numbers of processes
echo "----Numbers of processes ----"

ps aux | wc -l

# Extra (Stretch Goals)
echo "---- Extra Info ----"
echo "OS Version:"
cat /etc/redhat-release

echo "Uptime:"


uptime | awk -F'load average:' '{print $2}'

grep "Failed password" /var/log/secure | wc -l


echo "Logged in users:"
who

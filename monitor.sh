#!/bin/bash

LOG_FILE="./logs/system.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "===== $DATE =====" >> $LOG_FILE

# CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU%" >> $LOG_FILE

# Memory Usage
MEMORY=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100}')
echo "Memory Usage: $MEMORY%" >> $LOG_FILE

# Disk Usage
DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Disk Usage: $DISK%" >> $LOG_FILE

# Disk Alert
if [ "$DISK" -gt 80 ]; then
    echo "WARNING: Disk usage exceeded 80%!" >> $LOG_FILE
fi

echo "" >> $LOG_FILE

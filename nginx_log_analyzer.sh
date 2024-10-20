#!/bin/bash

# Define the log file location (update this path if needed)
LOG_FILE="/var/log/nginx/access.log"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found! Please make sure you have the nginx access log file at: $LOG_FILE"
  exit 1
fi

# Ensure the log file is readable
if [ ! -r "$LOG_FILE" ]; then
  echo "Log file is not readable! Please check the permissions: $LOG_FILE"
  exit 1
fi

# Top 5 IP addresses with the most requests
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""

# Top 5 most requested paths
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""

# Top 5 response status codes
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""

# Top 5 user agents
echo "Top 5 user agents:"
awk -F '"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

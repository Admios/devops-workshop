#!/bin/bash

# Check if a destination IP address is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <destination_ip>"
  exit 1
fi

destination_ip="$1"

traceroute_output=$(traceroute -n "$destination_ip")

# Print a header for the summary
echo "Hop     IP Address        Response Time (ms)"

# Use awk to process and format the traceroute output
echo "$traceroute_output" | awk '/^[[:space:]]*[0-9]+[[:space:]]+[^0-9.]/ {
    hop = $1;
    ip_address = $2;
    response_time = $(NF - 1);
    print hop "\t" ip_address "\t" response_time
  }'
  
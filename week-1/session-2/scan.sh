 #!/bin/bash

function check_ip() {
  if ping -c 1 -W 1 "$1" &>/dev/null; then
    echo "$1 is active"
  fi
}

# We asume input to be in the form of 192.168.0.1-100
ip_block="$1"

# Get ip host range. Example 1-10
ip_range=$(echo "$ip_block" | cut -d "." -f 4)

# Get the initial and final host from the ip range
start_ip=$(echo "$ip_range" | cut -d "-" -f 1)
end_ip=$(echo "$ip_range" | cut -d "-" -f 2)

# Get the ip prefix. Example 192.168.1
prefix=$(echo "$ip_block" | cut -d "." -f 1-3)
 
# Run the function for each ip address
for (( i=start_ip; i <= end_ip; i++ )); do
  check_ip "$prefix.$i" &
done

wait

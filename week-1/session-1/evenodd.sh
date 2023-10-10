#!/bin/bash

# Read input from the user
read -p "Enter a number: " num

# Check if the number is divisible by 2 (even) or not (odd)
if [ $((num % 2)) -eq 0 ]; then
  echo "$num is even."
else
  echo "$num is odd."
fi
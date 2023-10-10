#!/bin/bash

# Check if the source directory is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <source_directory>"
  exit 1
fi

source_dir="$1"
backup_dir="${source_dir}_backup_$(date +'%Y-%m-%d')"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Source directory does not exist: $source_dir"
  exit 1
fi

# Check if the backup directory already exists
if [ -d "$backup_dir" ]; then
  echo "Backup directory already exists: $backup_dir"
  exit 1
fi

# Create the backup directory
mkdir "$backup_dir"

# Copy files from the source directory to the backup directory
cp -r "$source_dir"/* "$backup_dir"

echo "Backup completed. Files from '$source_dir' are copied to '$backup_dir'."

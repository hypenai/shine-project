#!/bin/bash

# Prompt user for script name to remove
echo "Enter script name to remove:"
read script_name

# Check if script exists
if [ -f "scripts/$script_name.sh" ]; then
  # Remove script from all_scripts.sh
  sed -i "/bash scripts\/$script_name.sh/d" all_scripts.sh
  
  # Remove script file
  rm "scripts/$script_name.sh"
  
  echo "Script removed from workflow!"
else
  echo "Script not found!"
fi

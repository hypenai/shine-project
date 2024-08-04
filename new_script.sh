#!/bin/bash

# Prompt user for script name and description
echo "Enter script name:"
read script_name
echo "Enter script description:"
read script_description

# Create new script file with basic template
echo "#!/bin/bash" > "scripts/$script_name.sh"
echo "# $script_description" >> "scripts/$script_name.sh"
echo "# Add commands here" >> "scripts/$script_name.sh"

# Add new script to all_scripts.sh
echo "bash scripts/$script_name.sh" >> all_scripts.sh

# Commit changes to Git repository (if applicable)
git add .
git commit -m "Added new script: $script_name"

echo "New script created and added to workflow!"

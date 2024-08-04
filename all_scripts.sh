#!/bin/bash

# Set log file
LOG_FILE="script_execution.log"

# Activate virtual environment
echo "Activating virtual environment..." >> $LOG_FILE
source shine-env/Scripts/activate
if [ $? -ne 0 ]; then
  echo "Error activating virtual environment" >> $LOG_FILE
  exit 1
fi

# Check if virtual environment is activated
if [ -z "$VIRTUAL_ENV" ]; then
  echo "Virtual environment is not activated" >> $LOG_FILE
  exit 1
fi

# Create virtual environment (only if it doesn't exist)
if [ ! -d "shine-env" ]; then
  echo "Creating virtual environment..." >> $LOG_FILE
  python -m venv shine-env
  if [ $? -ne 0 ]; then
    echo "Error creating virtual environment" >> $LOG_FILE
    exit 1
  fi
fi

# Create scripts directory if it doesn't exist
echo "Creating scripts directory..." >> $LOG_FILE
mkdir -p scripts
if [ $? -ne 0 ]; then
  echo "Error creating scripts directory" >> $LOG_FILE
  exit 1
fi

# Create each script file
echo "Creating script files..." >> $LOG_FILE
for i in {1..26}; do
  filename="script$i.sh"
  touch "scripts/$filename"
  echo "#!/bin/bash" > "scripts/$filename"
  echo "# Add commands here" >> "scripts/$filename"
  if [ $? -ne 0 ]; then
    echo "Error creating script file $filename" >> $LOG_FILE
    exit 1
  fi
done

# Fill in the script files with specific commands
echo "Filling in script files with commands..." >> $LOG_FILE
echo "#!/bin/bash" > scripts/script1.sh
echo "echo 'Hello World!'" >> scripts/script1.sh
if [ $? -ne 0 ]; then
  echo "Error filling in script1.sh" >> $LOG_FILE
  exit 1
fi

echo "#!/bin/bash" > scripts/script2.sh
echo "echo 'This is script 2'" >> scripts/script2.sh
if [ $? -ne 0 ]; then
  echo "Error filling in script2.sh" >> $LOG_FILE
  exit 1
fi

# ... add more script files and commands as needed ...

# Make all script files executable
echo "Making script files executable..." >> $LOG_FILE
chmod +x scripts/*.sh
if [ $? -ne 0 ]; then
  echo "Error making script files executable" >> $LOG_FILE
  exit 1
fi

# Execute all script files
echo "Executing script files..." >> $LOG_FILE
for script in scripts/*.sh; do
  bash "$script"
  if [ $? -ne 0 ]; then
    echo "Error executing script $script" >> $LOG_FILE
    exit 1
  fi
done

# Deactivate virtual environment
echo "Deactivating virtual environment..." >> $LOG_FILE
deactivate
bash scripts/my_new_script.sh

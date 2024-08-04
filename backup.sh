#!/bin/bash

# Set backup directory
BACKUP_DIR="backups/$(date +'%Y-%m-%d_%H-%M-%S')"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup scripts
if [ -d "scripts" ]; then
  cp -r scripts "$BACKUP_DIR"
fi

# Backup data
if [ -d "data" ]; then
  cp -r data "$BACKUP_DIR"
fi

# Backup config
if [ -f "config.json" ]; then
  cp config.json "$BACKUP_DIR/config.json"
fi

echo "Backup complete: $BACKUP_DIR"

#!/bin/bash

# Pull latest changes from remote repository
echo "Pulling latest changes..."
git pull origin master --allow-unrelated-histories

# Resolve merge conflicts (if any)
echo "Resolving merge conflicts..."
git merge origin/master --allow-unrelated-histories

# Add and commit resolved changes
echo "Committing changes..."
git add .
git commit -m "Resolved merge conflicts"

# Push changes to remote repository
echo "Pushing changes..."
git push origin master

# Run Flask application
echo "Running Flask application..."
flask run

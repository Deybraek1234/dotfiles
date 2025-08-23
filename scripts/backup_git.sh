#!/bin/bash

REPO_PATH1="$HOME/stow/dotfiles"
REPO_PATH2="$HOME/stow/laboratori/Code"

cd "$REPO_PATH1"
if [[ $(git status --porcelain) ]]; then
  echo "Changes detected. Committing and pushing..."
  
  # Add all changes to the staging area
  git add .
  
  # Commit the changes with a timestamp
  git commit -m "Automated daily backup: $(date +%Y-%m-%d)"
  
  # Push the changes to the remote repository
  git push origin main
  
  echo "Backup completed successfully."
else
  echo "No changes to back up."
fi

cd "$REPO_PATH2"
if [[ $(git status --porcelain) ]]; then
  echo "Changes detected. Committing and pushing..."
  
  # Add all changes to the staging area
  git add .
  
  # Commit the changes with a timestamp
  git commit -m "Automated daily backup: $(date +%Y-%m-%d)"
  
  # Push the changes to the remote repository
  git push origin main
  
  echo "Backup completed successfully."
else
  echo "No changes to back up."
fi

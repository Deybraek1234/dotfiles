#!/bin/bash

#Array of directories to pull
DIRECTORIES=("$HOME/stow/dotfiles" "$HOME/stow/laboratori/Code" "$HOME/stow/Obsidian/Chimica" "$HOME/stow/Lab2/Code/Latex-projects")
BRANCH="master"

for dir in "${DIRECTORIES[@]}"; do
  if [ -d "$dir" ]; then
    echo "--- Pulling from $dir ---"
    {
      cd "$dir" || exit
      git pull
    }
  else
    echo "Directory $dir not found, skipping."
  fi
done

echo "--- Restore process complete --"

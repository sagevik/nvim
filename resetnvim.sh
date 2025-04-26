#! /usr/bin/env bash

echo "Resetting nvim..."

echo "Removing previous nvim backups if any exist"
if [ -d ~/.cache/nvim.bak ]; then
    rm -rf ~/.cache/nvim.bak
    echo "Removed ~/.cache/nvim.bak"
fi

if [ -d ~/.local/share/nvim.bak ]; then
    rm -rf ~/.local/share/nvim.bak
    echo "Removed ~/.local/share/nvim.bak"
fi

if [ -d ~/.local/state/nvim.bak ]; then
    rm -rf ~/.local/state/nvim.bak
    echo "Removed ~/.local/state/nvim.bak"
fi

echo "Backing up nvim"
mv ~/.cache/nvim{,.bak}
echo ".cache/nvim backed up"
mv ~/.local/share/nvim{,.bak}
echo ".local/share/nvim backed up"
mv ~/.local/state/nvim{,.bak}
echo ".local/state/nvim backed up"

echo "Reset done, please restart nvim"


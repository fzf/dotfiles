#!/bin/bash

#
# Uninstall all custom scripts and configuration files
#

# ensure sudo access
sudo -p "Enter your password: " echo "We're good to go!"
if [ $? -ne 0 ]; then exit 1; fi

# custom scripts
sudo rm -rf "$HOME/bin"
# ~ files and directories
sudo rm -rf "$HOME/.bash_profile"
sudo rm -rf "$HOME/.gemrc"
sudo rm -rf "$HOME/.gitconfig"
sudo rm -rf "$HOME/.gitignore"
sudo rm -rf "$HOME/.irbrc"
sudo rm -rf "$HOME/.pryrc"
sudo rm -rf "$HOME/.zshenv"
sudo rm -rf "$HOME/.zshrc"

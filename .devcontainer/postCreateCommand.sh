#!/bin/bash

sudo chsh -s $(which zsh) $(whoami)
sudo apt update -y
sudo apt upgrade -y
sudo apt install sqlite3 neovim -y
sudo apt install libffi-dev libyaml-dev -y # For installing ruby versions with rbenv
sudo apt install watchman -y # For installing ruby versions with rbenv

echo -e "\033[0;32mTo install rbenv, run:"
echo -e "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash"
echo -e "Then, close and reopen both vscode, and the vscode embedded terminal\033[0m"

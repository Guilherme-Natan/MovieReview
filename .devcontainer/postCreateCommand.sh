#!/bin/bash

sudo chsh -s $(which zsh) $(whoami)
sudo apt update -y
sudo apt upgrade -y
sudo apt install sqlite3 -y
sudo apt install neovim -y # Text editor
sudo apt install libffi-dev libyaml-dev -y # For installing ruby versions with rbenv
sudo apt install watchman -y # For installing ruby versions with rbenv
sudo apt install lnav -y # Interesting for reading logs

echo -e "\033[0;32mRead ./devcontainer/README.md on how to setup this devcontainer\033[0m"

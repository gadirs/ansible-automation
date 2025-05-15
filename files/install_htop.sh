#!/bin/bash
if [ ! -f "$HOME/.htop_installed" ]; then
  {
    echo "[$(date)] Installing htop for $USER"

    sudo apt update
    sudo apt install -y htop

    echo "[$(date)] htop installed for $USER"
    touch "$HOME/.htop_installed"
  } >> "$HOME/htop_install.log" 2>&1
fi


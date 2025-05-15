#!/bin/bash
if [ ! -f "$HOME/.intune_installed" ]; then
  echo "Installing Microsoft Intune for $USER..."

  # Step 1: Install dependencies
  sudo apt install -y curl gpg

  # Step 2: Microsoft signing key
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
  sudo install -o root -g root -m 644 /tmp/microsoft.gpg /usr/share/keyrings/
  rm /tmp/microsoft.gpg

  # Step 3: Add Microsoft repo
  codename=$(lsb_release -cs)
  sudo sh -c "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/\$(lsb_release -rs)/prod $codename main' > /etc/apt/sources.list.d/microsoft-ubuntu-$codename-prod.list"
  sudo apt update

  # Step 4: Install Intune
  sudo apt install -y intune-portal

  # Step 5: Mark as installed
  touch "$HOME/.intune_installed"
fi

#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    echo "Please upgrade via Docker Desktop instead of Chocolatey."
elif [ "$SYSTEM" == "mac" ]; then
    brew upgrade --cask docker
fi

if [ "$SYSTEM" != "mac" ]; then
    # Install the latest version of Docker CE.
    sudo apt-get install -y docker-ce

    # Install docker-compose
    sudo apt-get install -y jq
    sudo curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | jq --arg PLATFORM_ARCH "$(echo `uname -s`-`uname -m`)" -r '.assets[] | select(.name | endswith($PLATFORM_ARCH)).browser_download_url' | xargs sudo curl -L -o /usr/local/bin/docker-compose --url
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Ask about cleaning dangling images
echo "Would you like to clean up dangling images? [y/n]"
read -r answer
if [ "$answer" == "y" ]; then
  "$HOME/bin/docker-clean"
else
  echo "Skipping cleaning of dangling images - if you wish to clean them manually, run the docker-clean script."
fi

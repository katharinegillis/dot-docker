#!/usr/bin/env bash

# Install the latest version of Docker CE.
#sudo apt-get install -y docker-ce

# Install docker-compose
#sudo apt-get install -y jq
#sudo curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | jq --arg PLATFORM_ARCH "$(echo `uname -s`-`uname -m`)" -r '.assets[] | select(.name | endswith($PLATFORM_ARCH)).browser_download_url' | xargs sudo curl -L -o /usr/local/bin/docker-compose --url
#sudo chmod +x /usr/local/bin/docker-compose

# Ask about cleaning dangling images
echo "Would you like to clean up dangling images? [y/n]"
read -r answer
if [ "$answer" == "yes" ] || [ "$answer" == "y" ]; then
  "$HOME/bin/docker-clean"
else
  echo "Skipping cleaning of dangling images - if you wish to clean them manually, run the docker-clean script."
fi

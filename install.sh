#!/usr/bin/env bash

SYSTEM=$3


if [ "$SYSTEM" == "wsl" ]; then
    choco.exe install docker-desktop -y
    touch .restart.lock
    exit
elif [ "$SYSTEM" == "mac" ]; then
    brew install --cask docker
    open /Applications/Docker.app
    echo "Please follow the prompts to get Docker Desktop running, then press any key to continue."
    read -r var
fi

if [ "$SYSTEM" != "mac" ]; then
    # Install Docker's package dependencies.
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    # Download and add Docker's official public PGP key.
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Verify the fingerprint.
    sudo apt-key fingerprint 0EBFCD88

    # Add the `stable` channel's Docker upstream repository.
    #
    # If you want to live on the edge, you can change "stable" below to "test" or
    # "nightly". I highly recommend sticking with stable!
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

    # Update the apt package list (for the new apt repo).
    sudo apt-get update -y

    # Install the latest version of Docker CE.
    sudo apt-get install -y docker-ce

    # Allow your user to access the Docker CLI without needing root access.
    sudo usermod -aG docker "$USER"

    # Install docker-compose
    sudo apt-get install -y jq
    sudo curl --silent "https://api.github.com/repos/docker/compose/releases/latest" | jq --arg PLATFORM_ARCH "$(echo `uname -s`-`uname -m`)" -r '.assets[] | select(.name | endswith($PLATFORM_ARCH)).browser_download_url' | xargs sudo curl -L -o /usr/local/bin/docker-compose --url
    sudo chmod +x /usr/local/bin/docker-compose
fi
#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" == "wsl" ]; then
    choco.exe uninstall docker-desktop -y
elif [ "$SYSTEM" == "mac" ]; then
    brew uninstall --cask docker
fi

if [ "$SYSTEM" != "mac" ]; then
    # Uninstall Docker Compose
    sudo rm -rf /usr/local/bin/docker-compose

    # Uninstall Docker CE
    sudo apt-get remove -y docker-ce jq
fi

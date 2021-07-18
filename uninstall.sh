#!/usr/bin/env bash

SYSTEM=$3

if [ "$SYSTEM" != "mac" ]; then
    # Uninstall Docker Compose
    sudo rm -rf /usr/local/bin/docker-compose

    # Uninstall Docker CE
    sudo apt-get remove -y docker-ce jq
else
    echo -e "\e[33m No docker to uninstall for MacOS. These commands uninstall with Docker Desktop."
fi

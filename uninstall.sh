#!/usr/bin/env bash

# Uninstall Docker Compose
sudo rm -rf /usr/local/bin/docker-compose

# Uninstall Docker CE
sudo apt-get remove -y docker-ce jq

# We will not remove the supporting programs in case another package uses them

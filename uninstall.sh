#!/usr/bin/env bash

# Uninstall Docker Compose
pip uninstall -y docker-compose

# Uninstall Docker CE
sudo apt-get remove -y docker-ce

# We will not remove the supporting programs in case another package uses them
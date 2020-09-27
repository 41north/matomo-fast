#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

# Uninstall old version
apt remove -y docker docker-engine docker.io containerd runc

# Update repositories
apt update -y

# Install new dependencies
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    git

# Add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify fingerprint
apt-key fingerprint 0EBFCD88

# Add docker repository
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# Update repositories
apt update -y

# Install docker
apt install -y docker-ce docker-ce-cli containerd.io

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Give permissions to binary
chmod +x /usr/local/bin/docker-compose

#!/bin/sh
# Set Terraform input variable for Codespaces VM IP address.
echo 'export TF_VAR_codespaces_ip=`curl -s https://api.ipify.org`' >> ~/.bashrc

# Install Terraform CLI from Debian package.
./.devcontainer/install-terraform.sh

# Generate RSA key pair.
# Credit to https://stackoverflow.com/a/43235320.
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa

#!/bin/sh
echo 'export TF_VAR_codespaces_ip=`curl -s https://api.ipify.org`' >> ~/.bashrc
./install-terraform.sh

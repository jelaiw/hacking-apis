#!/bin/bash
TERRAFORM_DIR=../terraform
ANSIBLE_DIR=$(pwd)

# Write over existing Ansible inventory file from template.
cp inventory-template hosts

# Grab Terraform output variable values in JSON format.
cd $TERRAFORM_DIR
terraform output -json > $ANSIBLE_DIR/terraform_output.json

# Query values of interest.
cd -
KALI_IP=$(jq -r '.kali_ip.value' terraform_output.json)
VULNWEB_IP=$(jq -r '.vulnweb_ip.value' terraform_output.json)

# Replace placeholder with actual values.
sed -i "s/KALI_IP/$KALI_IP/g" hosts
sed -i "s/VULNWEB_IP/$VULNWEB_IP/g" hosts

# Clean up.
rm terraform_output.json

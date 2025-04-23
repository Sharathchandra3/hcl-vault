#!/bin/bash

# Step 1: Install GPG and Vault Dependencies
sudo apt update && sudo apt install -y gpg

# Step 2: Download HashiCorp's GPG Key
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Step 3: Verify the GPG Key's Fingerprint (Optional)
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

# Step 4: Add HashiCorp's Official Linux Repository to apt
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Step 5: Install Vault
sudo apt update && sudo apt install vault

# Step 6: Start Vault in Dev Mode (for learning/testing)
vault server -dev -dev-listen-address="0.0.0.0:8200" &

# Optional: Set the Vault environment variable
export VAULT_ADDR='http://127.0.0.1:8200'

echo "Vault installation complete. Dev server running at http://127.0.0.1:8200"

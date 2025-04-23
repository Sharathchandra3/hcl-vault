# Vault Installation and Configuration for AppRole Authentication

## Enable AppRole Authentication

To enable the AppRole authentication method in Vault, run the following command:

```bash
vault auth enable approle
Create the Vault Policy for Terraform
Create a policy that allows Terraform to interact with the secret/data/* path in Vault:

bash
Copy
Edit
vault policy write terraform - <<EOF
path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOF
Create the AppRole and Generate Role ID and Secret ID
Create an AppRole for Terraform and generate the Role ID and Secret ID by running the following:

bash
Copy
Edit
vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform
This will generate a Role ID and a Secret ID.

Store Secrets in Vault
To store a secret (e.g., demo-pass), use the following command:

bash
Copy
Edit
vault kv put secret/demo-pass demo-pass=1234
This will store the secret demo-pass with the value 1234 in Vault.
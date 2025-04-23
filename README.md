# Terraform Vault Integration

This project integrates HashiCorp Vault with Terraform to securely manage secrets and provision AWS EC2 instances.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- [HashiCorp Vault](https://www.vaultproject.io/downloads)
- AWS account with appropriate IAM permissions

## Setup

1. **Vault Installation**: Follow the steps in `install_vault.sh` to install Vault.

2. **Terraform Configuration**: 
   - The `main.tf` file configures the Vault and AWS providers, fetching secrets from Vault to tag EC2 instances.

3. **Run Terraform**:
   - Initialize the project: 
     ```bash
     terraform init
     ```
   - Plan the execution: 
     ```bash
     terraform plan
     ```
   - Apply the configuration: 
     ```bash
     terraform apply
     ```

## Notes

- Secrets are securely managed in Vault and retrieved by Terraform.
- Sensitive data should be excluded from version control (e.g., `.tfvars` files).

## Documentation

- [Terraform](https://www.terraform.io/docs)
- [Vault](https://www.vaultproject.io/docs)

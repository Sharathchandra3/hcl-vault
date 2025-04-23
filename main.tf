provider "vault" {
  address = "http://3.111.150.138:8200/"  # Replace with your Vault instance IP or hostname
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id       # Role ID for AppRole authentication
      secret_id = var.vault_secret_id     # Secret ID for AppRole authentication
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "secret"    # KV mount path
  name  = "demo-pass"  # Your secret's name
}

provider "aws" {
  region = "ap-south-1"  
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0e35ddab05955cf57"  
  instance_type = "t2.micro"  # Instance type

  tags = {
    Name   = "vault-test-instance"  # Instance name tag
    Secret = data.vault_kv_secret_v2.example.data["demo-pass"]  # Secret value pulled from Vault
  }
}

provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://3.111.187.23:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = "7aa1c9f1-3db0-6bf1-5af0-c1d8b98e35c7"
      secret_id = "143455f2-391b-987e-ee16-6090ed7562ec"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}



data "aws_security_group" "aws_sg" {
  
  name = "allow_ssh_http_https"
}


output "sg_id" {
  value = data.aws_security_group.aws_sg.id
}


resource "aws_instance" "aws_instance" {
  ami           = "ami-02b8269d5e85954ef"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0861d1766389a43bb"
  vpc_security_group_ids = [data.aws_security_group.aws_sg.id]
    key_name = "test-1"
    tags= {
    Name = "Vault-test-Instance"
    secret=data.vault_kv_secret_v2.example.data["username"]
    }
}


output "test" {
    sensitive = true
  value = data.vault_kv_secret_v2.example.data["username"]
  
}
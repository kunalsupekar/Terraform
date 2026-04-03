provider "aws" {
  region = "ap-south-1"

}


data "aws_instance" "my_instance" {
    filter {
    name   = "tag:Name"
    values = ["MyInstance"]
    }
    filter {
      name = "tag:client_name"
      values = [ "Thermax" ]
    }

  #instance_id = aws_instance.my_instance.id
  
}

resource "null_resource" "configure_instance" {

    triggers = {
        instance_id = data.aws_instance.my_instance.id
    }

    connection {
      host = data.aws_instance.my_instance.public_ip
      type = "ssh"
      user = "ubuntu"
    private_key = file("c:\\Users\\LENOVO\\Downloads\\test-1.pem")
    }

    provisioner "remote-exec" {
      inline = [
        "sudo apt update -y",
        "sudo sh -c \"reboot\"",
        "sudo systemctl reload nginx"
        ]
}

}
output "public_ip" {
  description = "public ip of instance"
  value       = data.aws_instance.my_instance.public_ip
}
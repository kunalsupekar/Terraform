output "public_ip" {
  description = "public ip of instance"
  value       = aws_instance.my_instance.public_ip
}


output "key_name" {
    description = "key pair attached to the instance"
    value       = aws_instance.my_instance.key_name
}
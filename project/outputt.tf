<<<<<<< HEAD
output "public_ip" {
  description = "public ip of instance"
  value       = aws_instance.my_instance.public_ip
}


output "key_name" {
  description = "key pair attached to the instance"
  value       = aws_instance.my_instance.key_name
=======
output "public_ip" {
  description = "public ip of instance"
  value       = aws_instance.my_instance.public_ip
}


output "key_name" {
    description = "key pair attached to the instance"
    value       = aws_instance.my_instance.key_name
>>>>>>> 36a8481b87de96d119948751340ee3c1f89036b8
}
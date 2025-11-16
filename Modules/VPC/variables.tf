variable "vpc_cidr" {
    type = string
    description = "CIDR for VPC"
  
}

variable "public_subnet_cidr" {
type = string
description = "CIDR for public subnet"

}

variable "tags" {
  type = map(string)

}

variable "igw_name" {
  
}
variable "client_name" {
  
}
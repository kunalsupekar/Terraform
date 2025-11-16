variable "db_identifier" {}
variable "db_subnet_group_name" {}
variable "private_subnet_ids" {
  type = list(string)
}

variable "storage" { type = number }
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}

variable "username" {}
variable "password" {
  sensitive = true
}

variable "db_sg_id" {}

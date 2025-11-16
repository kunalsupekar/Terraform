variable "lb_name" {}
variable "tg_name" {}

variable "public_subnets" {
  type = list(string)
}

variable "lb_sg_id" {}
variable "vpc_id" {}

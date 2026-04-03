variable "instance_name" {
  type = map(string)
  default = {
    dev  = "dev-EC2-Instance"
    prod = "prod-EC2-Instance"
  }

}

variable "ami_id" {
  description = "ami value for instance"
  type        = string
  default     = "ami-02b8269d5e85954ef"

}
variable "ami" {
  default     = "ami-031b91f37d0bd432d"
  type        = string
  description = "Custom AMI for Ubuntu 20.04 in ap-south-1"
}

variable "region" {}
variable "allow_ssh_sg" {}
variable "allow_http_sg" {}
variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}

variable "db_endpoint" {}

data "template_file" "userdata" {
  template = filebase64("${path.module}/userdata.sh")
  vars = {
    db_endpoint = var.db_endpoint
  }
}

# variable "key_name" {
#   description = "SSH Key used for the servers."
# }
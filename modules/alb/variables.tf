variable "region" {
  default     = "ap-south-1"
  description = "region used for the servers"
}

variable "allow_ssh_sg" {}
variable "allow_http_sg" {}

variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}
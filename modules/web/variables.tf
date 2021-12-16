variable "ami" {
  default     = "ami-0851b76e8b1bce90b"
  type        = string
  description = "Ubuntu 20.04 in ap-south-1"
}

variable "region" {}
variable "allow_ssh_sg" {}
variable "allow_http_sg" {}
variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}

# variable "key_name" {
#   description = "SSH Key used for the servers."
# }

# variable "subnet_id" {
#   description = "Subnet ID information for the Web servers."
# }

# variable "vpc_id" {
#   description = "VPC ID information for TF servers."
# }
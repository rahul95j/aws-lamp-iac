variable "region" {
  default     = "ap-south-1"
  description = "region used for the servers"
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR for the servers"
}
variable "subnet_one_cidr" {
  default     = "10.0.1.0/24"
  description = "Private Subnet CIDR for AZ1"
}
variable "subnet_two_cidr" {
  default     = "10.0.2.0/24"
  description = "Private Subnet CIDR for AZ2"
}

variable "subnet_three_cidr" {
  default     = "10.0.3.0/24"
  description = "Public Subnet CIDR for AZ1"
}

variable "subnet_four_cidr" {
  default     = "10.0.4.0/24"
  description = "Public Subnet CIDR for AZ2"
}

# variable "key_name" {
#   description = "SSH Key used for the servers."
# }

# variable "subnet_id" {
#   description = "Subnet ID information for the Web servers."
# }

# variable "vpc_id" {
#   description = "VPC ID information for TF servers."
# }
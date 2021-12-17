variable "region" {}
variable "vpc_id" {}
variable "allow_ssh_sg" {}
variable "allow_http_sg" {}

variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}

variable "webapp-asg" {}

variable "alb_listener_port" {
  default = 80
  type    = number
}
variable "alb_listener_protocol" {
  default = "HTTP"
  type    = string
}
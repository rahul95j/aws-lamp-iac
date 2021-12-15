provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "admin-user" {
  name = "dev1"
  tags = {
    Description = "Front-End"
  }
}
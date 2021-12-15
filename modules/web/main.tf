resource "aws_instance" "webserver" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  #key_name
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}", "${aws_security_group.allow_ssh.id}"]
  tags = {
    Name        = "webserver"
    Description = "apache"
  }
  user_data = <<-EOF
                #! /bin/bash
                ufw disable
                sudo apt update -y
                sudo apt install -y apache2
                systemctl start apache2
                systemctl enable apache2
                echo "Hello World from $(hostname -f)" > /var/www/html/index.html
                EOF
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
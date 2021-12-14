resource "aws_instance" "webserver" {
    ami           = "ami-0851b76e8b1bce90b"
    instance_type = "t2.micro"
    tags = {
        Name = "webserver"
        Description = "apache"
    }
    user_data = <<-EOF
                #! /bin/bash
                yum update -y
                yum install -y httpd.x86_64
                systemctl start httpd.service
                systemctl enable httpd.service
                echo “Hello World from $(hostname -f)” > /var/www/html/index.html
                EOF
}

provider "aws" {
    region = "ap-south-1"
}


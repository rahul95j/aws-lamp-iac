resource "aws_route_table" "webapp-public-rt" {
  vpc_id = aws_vpc.webapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webapp-igw.id
  }

  tags = {
    Name = "webapp-public-rt"
  }
}

resource "aws_route_table_association" "webapp-rta-public-subnet-1" {
  subnet_id      = aws_subnet.webapp-subnet-public-1.id
  route_table_id = aws_route_table.webapp-public-rt.id
}

resource "aws_route_table_association" "webapp-rta-public-subnet-2" {
  subnet_id      = aws_subnet.webapp-subnet-public-2.id
  route_table_id = aws_route_table.webapp-public-rt.id
}

#SG for allowing SSH
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
  vpc_id = aws_vpc.webapp-vpc.id
  tags = {
    Name = "allow_ssh"
  }
}

output "allow_ssh_sg" {
  value = "${aws_security_group.allow_ssh.id}"
}

#SG for allowing HTTP requests
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
  vpc_id = aws_vpc.webapp-vpc.id
  tags = {
    Name = "allow_http"
  }
}

output "allow_http_sg" {
  value = "${aws_security_group.allow_http.id}"
}
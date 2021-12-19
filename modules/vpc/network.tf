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



#SG for allowing DB requests
resource "aws_security_group" "allow_sql" {
  name        = "allow_sql"
  description = "Allow DB inbound traffic"

  ingress {
    description = "TCP from EC2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.subnet_three_cidr, var.subnet_four_cidr]
  }

  ingress {
    description = "SSH from EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.subnet_three_cidr, var.subnet_four_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = aws_vpc.webapp-vpc.id
  tags = {
    Name = "allow_sql"
  }
}

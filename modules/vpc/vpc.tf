# Create VPC

resource "aws_vpc" "webapp-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "webapp-vpc"
  }
}

output "vpc_id" {
  value = "${aws_vpc.webapp-vpc.id}"
}

resource "aws_internet_gateway" "webapp-igw" {
  vpc_id = aws_vpc.webapp-vpc.id
  tags = {
    Name = "webapp-igw"
  }
}

# Create 2 Private subnets and 2 Public Subnets across 2 AZs

resource "aws_subnet" "webapp-subnet-private-1" {
  vpc_id                  = aws_vpc.webapp-vpc.id
  cidr_block              = var.subnet_one_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.region}a"
  tags = {
    Name = "webapp-subnet-private-1"
  }
}

resource "aws_subnet" "webapp-subnet-private-2" {
  vpc_id                  = aws_vpc.webapp-vpc.id
  cidr_block              = var.subnet_two_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.region}b"
  tags = {
    Name = "webapp-subnet-private-2"
  }
}

resource "aws_subnet" "webapp-subnet-public-1" {
  vpc_id                  = aws_vpc.webapp-vpc.id
  cidr_block              = var.subnet_three_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"
  tags = {
    Name = "webapp-subnet-public-1"
  }
}

output "public_subnet_1_id" {
  value = "${aws_subnet.webapp-subnet-public-1.id}"
}

resource "aws_subnet" "webapp-subnet-public-2" {
  vpc_id                  = aws_vpc.webapp-vpc.id
  cidr_block              = var.subnet_four_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}b"
  tags = {
    Name = "webapp-subnet-public-2"
  }
}

output "public_subnet_2_id" {
  value = "${aws_subnet.webapp-subnet-public-2.id}"
}
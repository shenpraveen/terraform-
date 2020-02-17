# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block  = "${var.vpc_cidr}"
  tags = {
    Name = "terraVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = "${aws_vpc.terra_vpc.id}"
  tags = {
    Name = "main"
  }
}

# Subnets : public1
resource "aws_subnet" "public1" {
  vpc_id = "${aws_vpc.terra_vpc.id}"
  cidr_block = "${var.subnets_cidr1}"
  tags = {
    Name = "terraPubSubnet1"
  }
}

# Subnets : public2
resource "aws_subnet" "public2" {
  vpc_id = "${aws_vpc.terra_vpc.id}"
  cidr_block = "${var.subnets_cidr2}"
  tags = {
    Name = "terraPubSubnet2"
  }
}

# Route table: attach Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.terra_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terra_igw.id}"
  }
  tags = {
    Name = "publicRouteTable"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = "${aws_route_table.public_rt.id}"
}

# Route table association with public subnets
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = "${aws_route_table.public_rt.id}"
}


## VPC Configuration

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
}

resource "aws_eip" "elastic_ip_a" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat_gateway_a" {
  allocation_id = aws_eip.elastic_ip_a.id
  subnet_id     = aws_subnet.public_subnet_a.id
}

resource "aws_eip" "elastic_ip_b" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "nat_gateway_b" {
  allocation_id = aws_eip.elastic_ip_b.id
  subnet_id     = aws_subnet.public_subnet_b.id
}
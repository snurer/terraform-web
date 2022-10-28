resource "aws_internet_gateway" "dev_igw" { # Provides a resource to create a VPC Internet Gateway.
  vpc_id = aws_vpc.main.id
  tags = {
    Name = replace(local.name, "rtype", "igw")
  }
}

resource "aws_eip" "NatEIP" { # Provides an Elastic IP resource.
  vpc        = true
  depends_on = [aws_internet_gateway.dev_igw]
}

resource "aws_nat_gateway" "NATgw" { #Provides a resource to create NAT Gateway
  allocation_id = aws_eip.NatEIP.id
  subnet_id     = aws_subnet.public_subnet[0].id
}

# Route table for Public Subnet
# Public Subnet traffic reaches Internet via Internet Gateway
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
}

# Route table for Private Subnets
# Private Subnet traffic reaches the Internet via Nat Gateway
resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
}
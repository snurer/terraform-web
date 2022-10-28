resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = replace(local.name, "rtype", "pub-rtb")
  }
}
resource "aws_route_table" "priv_rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = replace(local.name, "rtype", "priv-rtb")
  }
}
resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.pub_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_igw.id
}

#Public Route Table association with Public Subnets

resource "aws_route_table_association" "pub_subnets" {
  count          = length(var.subnet_AZs)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.pub_rtb.*.id, count.index)
}

# Private Route Table Association with Private Subnets

resource "aws_route_table_association" "private_subnets" {
  count          = length(var.subnet_AZs)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.priv_rtb.*.id, count.index)
}




resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = replace(local.name, "rtype", "main-vpc")
  }
}
resource "aws_subnet" "public_subnet" {
  count                   = 3
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.subnet_AZs, count.index)
  tags = {
    "Name" = replace(local.name, "rtype", "public-subnet-${count.index}")
  }
}

resource "aws_subnet" "private_subnet" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.subnet_AZs, count.index)
  tags = {
    "Name" = replace(local.name, "rtype", "private-subnet-${count.index}")
  }
}

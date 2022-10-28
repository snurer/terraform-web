<img src="https://raw.githubusercontent.com/Saintmori/terraform/main/terraform.png" width="200" height="200">

# VPC with Terraform V1.2

This folder includes the code for the same task explained in [vpc_v1.1](https://github.com/snurer/terraform-vpc/tree/main/vpc_v1.1) 

In v1.2, the Terraform code has been improved with Element Function, Count meta-argument and Count.Index.

Let's explore them one by one;

## Element Function

Element function simply retrieves a single element from a list. 

```
element(list, index)
```

Note: The index is zero based. We can understand it better with the following examples:

```
> element(["a", "b", "c"], 1)
```
In here, the list is (a, b, c) and the index number is 1. The output for this function would be: ```b```

If the index number was "0", the output would be ```a``` because *index is zero based.*

You can check the [Element Function-Terraform Documentation](https://developer.hashicorp.com/terraform/language/functions/element) to learn more.

## Count 

Count is meta-argument. If we want to create multiple resources with the same configurations at all, we can use count meta argument.

Some of the resources can support count and some of them cannot.

```
resource "aws_instance" "first_ec2" {
  count        = 3
  ami           = "ami-08e2d37b6a0129927"
  instance_type = "t2.micro"
  tags = {
    Name        = "first"
  }
}
```
This code creates 3 similar EC2 instances with *count* meta argument.

## Count.Index

```count.index``` — The distinct index number (starting with 0) corresponding to this instance.

You have to have count meta argument to use count index.

It goes and index all the counts.

```
resource "aws_instance" "web_instance" {
count                  = 3
ami                    = var.ami_id
instance_type          = var.instance_type
vpc_security_group_ids = [aws_security_group.web.id]
tags = {
Name = "dev-${count.index}"
}
```
This code will create 3 similar EC2 instances and it will name it as "dev-0", "dev-1" and "dev-2"

**Note**: You have to use ```count``` to use ```count.index```

Check out [Terraform-Count Meta Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/count) to learn more.

# Combining Element Function, Count and Count.Index

In VPC v1.2, we combined these functions and meta arguments to improve our code. This allowed us to have less lines, more organized and clean code.

To achive this;

First, we defined variables with the lists for the elements that we would create multiple times. For example:

```
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "This is a list of ports for Public Subnet CIDRs"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
```

Then, while creating 3 VPC resources with the same configurations, we used ```element``` function and ```count.index```

```
resource "aws_subnet" "public_subnet" {
  count                   = 3
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.subnet_AZs, count.index)
  tags = {
    "Name" = "${var.env}-public-subnet-${count.index}"
  }
}
```

By this way, instead of having the same lines for 3 times to create VPC, we used ```count``` to create 3 VPC resources, and also ```element``` function to retrieve values from our ```public_subnet_cidr``` or ```subnet_AZs``` lists defined in our variables. 

So, ```element``` goes and gets values in ```public_subnet_cidrs``` and distributes to "public_subnets" in a row with the help of ```count.index```

-------

# Contribution

I hope the explanations are helpful!

Feel free to clone, use and contribute!

Author: [snurer](https://github.com/snurer)



data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "userdata" {
  template = file("userdata.sh")
  vars = {
    environment = var.env
  }
}

data "aws_vpc" "custom_vpc" {
  filter {
    name   = "tag:Name"
    values = ["aws-ue1-nonprod-dev-Ctask-main-vpc"]
  }
}
data "aws_lb_target_group" "main" {
  name = "aws-ue1-dev-Ctask-main-tg"
}

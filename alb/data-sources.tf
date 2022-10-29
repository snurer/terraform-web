data "aws_vpc" "custom_vpc" {
  filter {
    name   = "tag:Name"
    values = ["aws-ue1-nonprod-dev-Ctask-main-vpc"]
  }
}

data "aws_autoscaling_group" "dev_asg" {
  name = "aws-ue1-dev-nonprod-CTask-main_asg"
}

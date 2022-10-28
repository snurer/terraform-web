data "aws_vpc" "custom_vpc" {
  id = var.vpc_id
}

data "aws_autoscaling_group" "dev_asg" {
  name = "aws-ue1-dev-nonprod-CTask-main_asg"
}
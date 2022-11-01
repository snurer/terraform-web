data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "aws-session-may22-remote-backend"
    region = "us-west-2"
    key    = "vpc/backend/terraform.tfstate"
  }
}

data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "aws-session-may22-remote-backend"
    region = "us-west-2"
    key    = "asg/backend/terraform.tfstate"
  }
}
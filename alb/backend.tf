terraform {
  backend "s3" {
    bucket         = "aws-session-may22-remote-backend"
    region         = "us-west-2"
    key            = "alb/terraform.tfstate"
    dynamodb_table = "terraform-may2022-state-lock-table"
  }
}
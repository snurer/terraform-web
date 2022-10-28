locals {
  name = "aws-${var.region}-${var.env}-${var.project}-rtype"
  common_tags = {
    Team        = "DevOps"
    Owner       = "Nur"
    Environment = var.env
    Project     = var.project
    Managed_by  = "Terraform"
  }
}
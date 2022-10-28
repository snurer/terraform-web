################### Variables for Locals ##################
variable "env" {
  type        = string
  description = "This is a variable for environment"
  default     = "dev"
}

variable "region" {
  type        = string
  description = "This is a variable for region"
  default     = "ue1"
}


variable "project" {
  type        = string
  description = "This is a variable for the project"
  default     = "CTask"
}
###################### Variables for Ports, VPC and Subnets ####################

variable "app_port" {
  type    = number
  default = 80
}

variable "vpc_id" {
  type        = string
  description = "variable for vpc_id"
  default     = "vpc-054b2a5ad41b642fe"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-0deebc272263ef575", "subnet-0f5d97c41457da329", "subnet-074cc41f00068d5f1"]
}

variable "ingress_ports" {
  type        = list(string)
  description = "Variables for Ingress Ports in SG"
  default     = ["80", "443"]
}


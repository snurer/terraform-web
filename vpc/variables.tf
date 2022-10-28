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

variable "stage" {
  type        = string
  description = "This is a variable for stage"
  default     = "nonprod"
}

variable "project" {
  type        = string
  description = "This is a variable for the project"
  default     = "CTask"
}

variable "instance_type" {
  type        = string
  description = "This is a variable for instance type"
  default     = "t2.micro"
}

variable "main_vpc_cidr" {
  type        = string
  description = "This is a variable for the Main Vpc Cidr Block"
  default     = "10.0.0.0/16"
}

variable "ingress_ports" {
  type        = list(string)
  description = "This is a list of ports for ingress rule"
  default     = ["22", "80"]
}


variable "public_subnet_cidrs" {
  type        = list(string)
  description = "This is a list of ports for Public Subnet CIDRs"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "This is a list of ports for Private Subnet CIDRs"
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "subnet_AZs" {
  type        = list(string)
  description = "This is a list of ports for Subnet AZs"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

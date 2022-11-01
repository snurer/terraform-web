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


variable "ingress_ports" {
  type        = list(string)
  description = "Variables for Ingress Ports in SG"
  default     = ["80", "443"]
}


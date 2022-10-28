variable "env" {
  type        = string
  description = "This is a variable for environment"
  default     = "dev"
}

variable "instance_type" {
  type        = string
  description = "This is a variable for instance type"
  default     = "t2.micro"
}
variable "max_size" {
  type        = number
  description = "Maximum number is instances"
  default     = 5
}

variable "min_size" {
  type        = number
  description = "Minimum number is instances"
  default     = 2
}

variable "desired_capacity" {
  type        = number
  description = "Desired number is instances"
  default     = 3
}

variable "force_delete" {
  type        = bool
  description = "--"
  default     = true
}

variable "vpc_zone_identifier" {
  type        = list(string) #[]
  description = "Subnets to create EC2 instances on"
  default     = ["subnet-0deebc272263ef575", "subnet-0f5d97c41457da329", "subnet-074cc41f00068d5f1"]
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

variable "ingress_ports" {
  type        = list(string)
  description = "Variable for ingress ports"
  default     = ["22", "80"]

}

variable "vpc_id" {
  type        = string
  description = "variable for vpc_id"
  default     = "vpc-054b2a5ad41b642fe"
}
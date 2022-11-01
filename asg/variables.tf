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


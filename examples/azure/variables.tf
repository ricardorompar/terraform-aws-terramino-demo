variable "app_name" {
  description = "Name for the application to deploy. This will also be included in the names of some of the resources."
  type        = string
}

variable "port" {
  type    = number
  default = 80
}

# Make sure to use a valid instance type for the cloud provider you are using
variable "instance_type" {
  type    = string
  default = "Standard_B1s"
}
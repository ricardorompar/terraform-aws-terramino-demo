variable "app_name" {
  description = "Name for the application to deploy. This will also be included in the names of some of the resources."
  type    = string
}

variable "port" {
  type    = number
  default = 80
}

variable "instance_type" {
  type    = string
  default = "Standard_B1s"
  validation {
    condition     = contains(["Standard_B1s", "Standard_B2s", "Standard_B2ps_v2"], var.instance_type)
    error_message = "Valid instance types are Standard_B1s, Standard_B2s, and Standard_B2ps_v2."
  }
}

variable "location" {
  type    = string
  default = "centralus"
}
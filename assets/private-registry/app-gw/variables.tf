variable "app_name" {
  description = "Name for the application to deploy. This will also be included in the names of some of the resources."
  type    = string
}

variable "resource_group_name" {
  type    = number
}

variable "virtual_network_name" {
  type    = number
}

variable "location" {
  type    = string
}

variable "vm_ips" {
  type = list(string)
  description = "Private IPs of the backend VMs for this App GW."
}

variable "vm_subnet_prefix" {
  type = string
  description = "IP ranges of the VM subnet."
}
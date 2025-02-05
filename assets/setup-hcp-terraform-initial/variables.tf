# Copyright (c) HashiCorp, Inc.

# This variable will be taken from the environment TFC_ORG 
variable "tfc_org" {
  type = string
}

# This variable will be taken from the environment ADMIN_USER
variable "admin_user" {
  type = string
}

variable "tf_workspace_tags" {
  type    = list(any)
  default = ["terramino", "azure", "hcp"]
}
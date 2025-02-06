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

# For oauth:
variable "gitlab_token" {
  type = string
}

variable "gitlab_base_url" {
  type    = string
  default = "http://gitlab"
}

variable "gitlab_group_path" {
  type    = string
  default = "platform-grp"
}
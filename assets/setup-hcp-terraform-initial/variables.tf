# Copyright (c) HashiCorp, Inc.

# This variable will be taken from the environment TF_ORG 
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

# For authentication to Azure:
variable "arm_client_id" {
  description = "App ID of the service principal."
  type = string
}

variable "arm_client_secret" {
  description = "Password of the service principal."
  type = string
}

variable "arm_subscription_id" {
  description = "ID of your subscription."
  type = string
}

variable "arm_tenant_id" {
  description = "ID of your tenant."
  type = string
}
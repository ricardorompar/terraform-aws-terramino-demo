# This variable will be taken from the environment TFC_ORG 
variable "tfc_org" {
  type = string
}

# This variable will be taken from the environment ADMIN_USER
variable "admin_user" {
  type = string
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

#For deployment:
variable "app_name" {
  description = "Name for the application to deploy. This will also be included in the names of some of the resources."
  type = string
  
}
variable "location" {
  description = "Azure region to deploy your resources in."
  type = string
}
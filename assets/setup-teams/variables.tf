# FOR DATA:
# This variable will be taken from the environment TFC_ORG 
variable "tfc_org" {
  type = string
}

# This variable will be taken from the environment ADMIN_USER
variable "admin_user" {
  type = string
}

# FOR TEAMS:
variable "admins" {
  type = list(string)
  default = [
    "workshops+lars@hashicorp.com"
  ]
}

variable "developers" {
  type = list(string)
  default = [
    "workshops+aisha@hashicorp.com"
  ]
}

variable "managers" {
  type = list(string)
  default = [
    "workshops+hiro@hashicorp.com"
  ]
}
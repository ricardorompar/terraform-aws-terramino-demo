variable "app_name" {
  type    = string
  default = "hashicardo"
}

variable "port" {
  type    = number
  default = 80
}

variable "instance_type" {
  type = string
  default = "t3.small"
}

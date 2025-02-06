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
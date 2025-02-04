variable "gitlab_ssh_key" {
  type        = string
  description = "value of the public ssh key for GitLab authentication"
}

variable "gitlab_token" {
  type = string
}

variable "gitlab_base_url" {
  type    = string
  default = "http://gitlab"
}
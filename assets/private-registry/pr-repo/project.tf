# Creates:
# - GitLab repo for terramino-policies

## Create new groups in Gitlab
data "gitlab_group" "platform" {
  full_path = var.gitlab_group_path
}

## Creates a new project under the Platform group in Gitlab
resource "gitlab_project" "app_gateway" {
  name                   = "app-gateway"
  namespace_id           = data.gitlab_group.platform.id
  visibility_level       = "public"
  default_branch         = "main"
  initialize_with_readme = false
  description            = "Control repo for a module in your HCP Terraform organization."
}
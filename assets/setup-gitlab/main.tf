# Creates:
# - GitLab repo for terramino
# - GitLab user for platform team member
# - Gitlab user token (needed ?)

## Local variables
locals {
  ### GitLab Groups
  gitlab_group_platform = {
    name             = "Platform Group"
    path             = "platform-grp"
    description      = "Platform Group"
    visibility_level = "public"
  }

  ### Gitlab Users
  gitlab_user = {
    username = "platform_admin"
    email    = "platform_admin@instruqtuser.create"
    name     = "Platform admin learner"
    password = "H@shiCorp1!"
  }
  ### GitLab Projects
  gitlab_projects = toset([
    "terramino"
  ])
}

## Create new groups in Gitlab
resource "gitlab_group" "platform" {
  name             = local.gitlab_group_platform.name
  path             = local.gitlab_group_platform.path
  description      = local.gitlab_group_platform.description
  visibility_level = local.gitlab_group_platform.visibility_level
}

resource "gitlab_group_membership" "platform" {
  group_id     = gitlab_group.platform.id
  access_level = "maintainer"
  user_id      = gitlab_user.platform_admin.id
}

## Create a new user in Gitlab for the Instruqt learner
resource "gitlab_user" "platform_admin" {
  username = local.gitlab_user.username
  email    = local.gitlab_user.email
  name     = local.gitlab_user.name
  password = local.gitlab_user.password
}

resource "gitlab_user_sshkey" "platform_admin" {
  user_id = gitlab_user.platform_admin.id
  title   = "Instruqt Workstation"
  key     = var.gitlab_ssh_key
}

## Creates a new project under the Platform group in Gitlab
resource "gitlab_project" "terramino_repo" {
  for_each               = local.gitlab_projects
  name                   = each.value
  namespace_id           = gitlab_group.platform.id
  visibility_level       = "public"
  default_branch         = "main"
  initialize_with_readme = false
  description            = "Control repo for the resources in the Terramino app."
}
# For Terramino worskpace:
data "tfe_workspace" "terramino" {
  name         = "terramino-${var.admin_user}"
  organization = var.tfc_org
}

data "tfe_oauth_client" "gitlab" {
  organization = var.tfc_org
  name = "instruqt-learners-gitlab"
}
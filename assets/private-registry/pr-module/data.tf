data "tfe_oauth_client" "gitlab" {
  organization = var.tfc_org
  name = "instruqt-learners-gitlab"
}
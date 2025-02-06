# Add GitLab VCS provider to HCP Terraform org
## Setup VCS OAuth Connection
resource "tfe_oauth_client" "gitlab" {
  name = "instruqt-learners-gitlab"
  organization     = var.tfc_org
  api_url          = "${var.gitlab_base_url}/api/v4"
  http_url         = var.gitlab_base_url
  oauth_token      = var.gitlab_token
  service_provider = "gitlab_community_edition"
}
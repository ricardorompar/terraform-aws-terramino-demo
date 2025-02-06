import {
  to = tfe_workspace.terramino
  id = data.tfe_workspace.terramino.id
}

resource "tfe_workspace" "terramino" {
  name           = "terramino-${var.admin_user}"
  organization   = data.tfe_organization.org.name
  tag_names      = var.tf_workspace_tags
  project_id     = data.tfe_project.acme.id

  vcs_repo {
    identifier     = "${var.gitlab_base_url}/${var.gitlab_group_path}/terramino"
    oauth_token_id = tfe_oauth_client.gitlab.oauth_token_id
  }
}
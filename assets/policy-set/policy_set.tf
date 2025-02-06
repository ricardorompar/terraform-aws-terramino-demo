resource "tfe_policy_set" "test" {
  name                = "terramino-policy-set"
  description         = "A set of policies to standardize VM deployment and limit cloud spend."
  organization        = var.tfc_org
  kind                = "sentinel"
  agent_enabled       = "false"
  workspace_ids       = [data.tfe_workspace.terramino.id]

  vcs_repo {
    identifier         = "${var.gitlab_group_path}/terramino-policies"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = data.tfe_oauth_client.gitlab.oauth_token_id
  }
}
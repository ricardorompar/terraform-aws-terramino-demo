# For Terramino worskpace:
data "tfe_workspace" "terramino" {
  name         = "terramino-${var.admin_user}"
  organization = var.tfc_org
}

resource "tfe_workspace_settings" "local_execution" {
  workspace_id   = data.tfe_workspace.terramino.id
  # CHANGE THIS VALUE
  execution_mode = "local"
}
resource "tfe_workspace_settings" "local_execution" {
  workspace_id   = data.tfe_workspace.terramino.id
  execution_mode = "remote"
}
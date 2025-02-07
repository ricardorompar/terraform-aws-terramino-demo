resource "tfe_registry_module" "app-gateway" {
  organization = var.tfc_org
  vcs_repo {
    display_identifier = "app-gateway"
    identifier         = "platform-grp/terraform-azurerm-app-gateway"
    oauth_token_id     = data.tfe_oauth_client.gitlab.oauth_token_id
  }
}
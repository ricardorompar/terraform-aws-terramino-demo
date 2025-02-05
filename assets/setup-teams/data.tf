data "tfe_workspace" "terramino" {
  name          = "terramino-${var.admin_user}"
  organization  = var.tfc_org
}

data "tfe_organization" "org" {
  name = var.tfc_org
}
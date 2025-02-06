data "tfe_organization" "org" {
  name = var.tfc_org
}

data "tfe_project" "acme" {
  name = "acme-project"
  organization = data.tfe_organization.org.name
}

data "tfe_workspace" "terramino" {
  name           = "terramino-${var.admin_user}"
  organization   = data.tfe_organization.org.name
}
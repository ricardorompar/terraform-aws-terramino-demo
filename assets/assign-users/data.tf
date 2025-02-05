data "tfe_organization" "org" {
  name = var.tfc_org
}

resource "tfe_team" "admins" {
  name         = "admins"
  organization = data.tfe_organization.org.name
}

resource "tfe_team" "developers" {
  name         = "developers"
  organization = data.tfe_organization.org.name
}

resource "tfe_team" "managers" {
  name         = "managers"
  organization = data.tfe_organization.org.name
}
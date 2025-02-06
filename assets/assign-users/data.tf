data "tfe_organization" "org" {
  name = var.tfc_org
}

data "tfe_team" "admins" {
  name         = "admins"
  organization = data.tfe_organization.org.name
}

data "tfe_team" "developers" {
  name         = "developers"
  organization = data.tfe_organization.org.name
}

data "tfe_team" "managers" {
  name         = "managers"
  organization = data.tfe_organization.org.name
}
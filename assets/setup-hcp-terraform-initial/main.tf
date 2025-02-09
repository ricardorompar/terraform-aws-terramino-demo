# Copyright (c) HashiCorp, Inc.

data "tfe_organization" "org" {
  name = var.tfc_org
}

resource "tfe_project" "acme" {
  name = "acme-project"
  organization = data.tfe_organization.org.name
  description = "Project for ACME infrastructure."
}

resource "tfe_workspace" "terramino" {
  name           = "terramino-${var.admin_user}"
  organization   = data.tfe_organization.org.name
  tag_names      = var.tf_workspace_tags
  project_id     = tfe_project.acme.id
  auto_apply     = true
}

resource "tfe_workspace_settings" "local_execution" {
  workspace_id   = tfe_workspace.terramino.id
  execution_mode = "local"
}
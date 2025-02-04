# Copyright (c) HashiCorp, Inc.

terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.63.0"
    }
  }
}

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
  project_id = tfe_project.acme.id
}
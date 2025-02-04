#######################
#     Variable set    #
#######################
resource "tfe_variable_set" "azure_creds" {
  name          = "Azure credentials"
  description   = "Credentials needed for HCP to log in to Azure."
  organization  = var.tfc_org
  global        = true
}

# Variables:
resource "tfe_variable" "arm_client_id" {
  key             = "ARM_CLIENT_ID"
  value           = var.arm_client_id
  category        = "env"
  description     = "App ID of the service principal."
  variable_set_id = tfe_variable_set.azure_creds.id
  sensitive       = true
}

resource "tfe_variable" "arm_client_secret" {
  key             = "ARM_CLIENT_SECRET"
  value           = var.arm_client_secret
  category        = "env"
  description     = "Password of the service principal."
  variable_set_id = tfe_variable_set.azure_creds.id
  sensitive       = true
}

resource "tfe_variable" "arm_subscription_id" {
  key             = "ARM_SUBSCRIPTION_ID"
  value           = var.arm_subscription_id
  category        = "env"
  description     = "ID of your subscription."
  variable_set_id = tfe_variable_set.azure_creds.id
}

resource "tfe_variable" "arm_tenant_id" {
  key             = "ARM_TENANT_ID"
  value           = var.arm_tenant_id
  category        = "env"
  description     = "ID of your tenant."
  variable_set_id = tfe_variable_set.azure_creds.id
}
# This could be a variable. Using local for consistency with aws module.
# In the aws module the location is established in the provider configuration
locals {
  location = "centralus"
}

resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.app_name}-demo"
  location = local.location

  tags = {
    environment = "Development"
  }
}
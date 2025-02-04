resource "azurerm_resource_group" "myresourcegroup" {
  name     = "${var.app_name}-demo"
  location = var.location

  tags = {
    environment = "Development"
  }
}
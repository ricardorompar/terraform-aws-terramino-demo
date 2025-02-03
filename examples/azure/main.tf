terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.17.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "terramino-web-app" {
  source        = "../../azure"
  app_name      = var.app_name
  port          = var.port
  instance_type = var.instance_type
}
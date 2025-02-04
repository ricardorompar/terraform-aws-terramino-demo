#############################
#      virtual network      #
#############################
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.app_name}-vnet"
  location            = azurerm_resource_group.myresourcegroup.location
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}

#######################
#      VM Subnet      #
#######################
resource "azurerm_subnet" "vm_subnet" {
  name                 = "${var.app_name}-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.myresourcegroup.name
  address_prefixes     = ["10.0.10.0/24"]
}


#######################
#   Security Groups   #
#######################
resource "azurerm_network_security_group" "allow_web_traffic" {
  name                = "allow_web_traffic_${var.app_name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  security_rule {
    name                       = "allow-web"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "${var.port}"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-ssh"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-egress"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
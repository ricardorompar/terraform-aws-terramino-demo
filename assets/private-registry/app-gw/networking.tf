#######################
#     AppGW Subnet    #
#######################
resource "azurerm_subnet" "appgw_subnet" {
  name                 = "${var.app_name}-appgw-subnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = ["10.0.11.0/24"]
}

#######################
#   Security Groups   #
#######################
# SG1: will be used to allow communication between the two Subnets:

resource "azurerm_network_security_group" "vm_subnet_nsg" {
  name                = "${var.app_name}-sg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowAppGwToVM"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = azurerm_subnet.appgw_subnet.address_prefixes[0]
    destination_address_prefix = var.vm_subnet_prefix
  }
}
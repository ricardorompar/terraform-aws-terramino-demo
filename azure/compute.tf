#######################
#      Public IP      #
#######################
resource "azurerm_public_ip" "pubip" {
  name                = "${var.app_name}-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name
  allocation_method   = "Static"
# Optional domain name label. Removing in case resources are attempted to be created again.
#   domain_name_label   = var.app_name  
}

#######################
# Network interfaces  #
#######################
resource "azurerm_network_interface" "nic" {
  name                = "${var.app_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  ip_configuration {
    name                          = "${var.app_name}-ipconfig"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pubip.id
  }
}

# NSG association to the NIC:
resource "azurerm_network_interface_security_group_association" "nic-sg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.allow_web_traffic.id
}

########################
#     Terramino VM     #
########################
resource "azurerm_linux_virtual_machine" "web" {
  name                            = "terramino-${var.app_name}"
  location                        = var.location
  resource_group_name             = azurerm_resource_group.myresourcegroup.name
  size                            = var.instance_type
  admin_username                  = "hashicorp"
  admin_password                  = "Passw0rd1234!"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id]

  user_data = base64encode(templatefile("boot.sh", {
    app_name = var.app_name,
    port     = var.port
  }))

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-LTS-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "60"

  }

  tags = {}

  # Added to allow destroy to work correctly.
  depends_on = [azurerm_network_interface_security_group_association.nic-sg]
}
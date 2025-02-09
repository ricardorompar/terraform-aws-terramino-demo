# module "application-gateway" {
#   source = "<enter_your_module_path_here>" #Change this for your org source
#   version = "0.0.1"
#   app_name = var.app_name
#   location = var.location

#   resource_group_name  = azurerm_resource_group.myresourcegroup.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   vm_ips               = azurerm_network_interface.nic.private_ip_addresses
#   vm_subnet_prefix     = azurerm_subnet.vm_subnet.address_prefixes[0]
# }


# output "new_ip" {
#     value = module.application-gateway.new_ip
# }
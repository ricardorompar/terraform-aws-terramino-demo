output "new_ip" {
  value = "http://${azurerm_public_ip.appgw-pip.ip_address}"
}
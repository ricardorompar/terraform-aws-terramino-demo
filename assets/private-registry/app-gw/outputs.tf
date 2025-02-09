output "new_url" {
  value = "http://${azurerm_public_ip.appgw-pip.fqdn}"
}

output "new_ip" {
  value = "http://${azurerm_public_ip.appgw-pip.ip_address}"
}
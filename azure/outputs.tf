output "hostname" {
  value = "http://${azurerm_public_ip.pubip.ip_address}"
}

output "ip" {
  value = azurerm_public_ip.pubip.ip_address
}
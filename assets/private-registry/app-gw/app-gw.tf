resource "random_integer" "domain" {
  min = 10000
  max = 99999
}

#######################
#      Public IP      #
#######################
resource "azurerm_public_ip" "appgw-pip" {
  name                = "${var.app_name}-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.app_name}-${random_integer.domain.result}"
}

#######################
# Application Gateway #
#######################
# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${var.app_name}-beap"
  frontend_port_name             = "${var.app_name}-feport"
  frontend_ip_configuration_name = "${var.app_name}-feip"
  http_setting_name              = "${var.app_name}-be-htst"
  listener_name                  = "${var.app_name}-httplstn"
  request_routing_rule_name      = "${var.app_name}-rqrt"
  redirect_configuration_name    = "${var.app_name}-rdrcfg"
}

resource "azurerm_application_gateway" "network" {
  name                = "${var.app_name}-appgateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  #Associate with the WAF defined below
  firewall_policy_id  = azurerm_web_application_firewall_policy.example.id
  depends_on = [ azurerm_web_application_firewall_policy.example ]

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.appgw_subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgw-pip.id
  }

  backend_address_pool {
    name            = local.backend_address_pool_name
    ip_addresses    = var.vm_ips
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    # path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}

#########################
#    AppGW WAF policy   #
#########################
resource "azurerm_web_application_firewall_policy" "example" {
  name                = "${var.app_name}-wafpolicy1"
  resource_group_name = var.resource_group_name
  location            = var.location

  custom_rules {
    name      = "BlockRule2"
    priority  = 2
    rule_type = "MatchRule"

    match_conditions {
      match_variables {
        variable_name = "QueryString"
      }

      operator           = "Contains"
      match_values       = ["promo"]
    }
    action = "Block"
  }

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
  }

  managed_rules {

    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
      rule_group_override {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"

        rule {
          id      = "920440"
          enabled = true
          action  = "Block"
        }
      }
    }
  }
}
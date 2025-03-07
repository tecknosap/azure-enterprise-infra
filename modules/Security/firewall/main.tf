# ===============================
# Public IP for Firewall
# ===============================
resource "azurerm_public_ip" "fw_pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ===============================
# Azure Firewall Resource
# ===============================
resource "azurerm_firewall" "fw" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.fw_subnet_id
    public_ip_address_id = azurerm_public_ip.fw_pip.id
  }
  firewall_policy_id = azurerm_firewall_policy.tnk-firewall-policy.id
}

# ===============================
# Firewall Policy Resource
# ===============================
resource "azurerm_firewall_policy" "tnk-firewall-policy" {
  name                = "tnk-firewall-policy"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# ===============================
# Firewall Policy Rule Collection Group
# ===============================
resource "azurerm_firewall_policy_rule_collection_group" "tnk-policy-rules" {
  name                = "tnk-policy-rules"
  firewall_policy_id  = azurerm_firewall_policy.tnk-firewall-policy.id
  priority            = 100

  network_rule_collection {
    name     = "network-rules"
    priority = 100
    action   = "Allow"

    rule {
      name                 = "spoke2-to-spoke1"
      source_addresses     = ["192.168.0.0/24"]
      destination_addresses = ["172.16.0.0/24"]
      destination_ports    = ["*"]
      protocols            = ["Any"]
    }

    rule {
      name                 = "spoke1-to-spoke2"
      source_addresses     = ["172.16.0.0/24"]
      destination_addresses = ["192.168.0.0/24"]
      destination_ports    = ["*"]
      protocols            = ["Any"]
    }
  }
}

# ===============================
# Hub Virtual Network
# ===============================
resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.hub_vnet_address_space
}

# ===============================
# Hub Data Subnet
# ===============================
resource "azurerm_subnet" "hub_data" {
  name                 = var.hub_data_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.hub_data_address_prefixes
}

# ===============================
# Hub Firewall Subnet
# ===============================
resource "azurerm_subnet" "hub_firewall" {
  name                 = var.hub_firewall_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.hub_firewall_address_prefixes
}

# ===============================
# Spoke 1 to Hub VNet Peering Resource
# ===============================
resource "azurerm_virtual_network_peering" "spoke_1_to_hub" {
  name                           = var.spoke_1_to_hub_name
  resource_group_name            = var.resource_group_name
  virtual_network_name           = var.spoke_1_vnet_name
  remote_virtual_network_id     = var.hub_vnet_id
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
  allow_gateway_transit         = false
  use_remote_gateways           = false
}

# ===============================
# Hub to Spoke 1 VNet Peering Resource
# ===============================
resource "azurerm_virtual_network_peering" "hub_to_spoke_1" {
  name                           = var.hub_to_spoke_1_name
  resource_group_name            = var.resource_group_name
  virtual_network_name           = var.hub_vnet_name
  remote_virtual_network_id     = var.spoke_1_vnet_id
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
  allow_gateway_transit         = false
  use_remote_gateways           = false
}

# ===============================
# Spoke 2 to Hub VNet Peering Resource
# ===============================
resource "azurerm_virtual_network_peering" "spoke_2_to_hub" {
  name                           = var.spoke_2_to_hub_name
  resource_group_name            = var.resource_group_name
  virtual_network_name           = var.spoke_2_vnet_name
  remote_virtual_network_id     = var.hub_vnet_id
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
  allow_gateway_transit         = false
  use_remote_gateways           = false
}

# ===============================
# Hub to Spoke 2 VNet Peering Resource
# ===============================
resource "azurerm_virtual_network_peering" "hub_to_spoke_2" {
  name                           = var.hub_to_spoke_2_name
  resource_group_name            = var.resource_group_name
  virtual_network_name           = var.hub_vnet_name
  remote_virtual_network_id     = var.spoke_2_vnet_id
  allow_virtual_network_access  = true
  allow_forwarded_traffic       = true
  allow_gateway_transit         = false
  use_remote_gateways           = false
}

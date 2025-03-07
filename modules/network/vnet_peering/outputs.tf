# ===============================
# Spoke 1 to Hub VNet Peering Output
# ===============================
output "spoke_1_to_hub_peering" {
  description = "Spoke 1 to Hub VNet Peering"
  value       = azurerm_virtual_network_peering.spoke_1_to_hub.id
}

# ===============================
# Hub to Spoke 1 VNet Peering Output
# ===============================
output "hub_to_spoke_1_peering" {
  description = "Hub to Spoke 1 VNet Peering"
  value       = azurerm_virtual_network_peering.hub_to_spoke_1.id
}

# ===============================
# Spoke 2 to Hub VNet Peering Output
# ===============================
output "spoke_2_to_hub_peering" {
  description = "Spoke 2 to Hub VNet Peering"
  value       = azurerm_virtual_network_peering.spoke_2_to_hub.id
}

# ===============================
# Hub to Spoke 2 VNet Peering Output
# ===============================
output "hub_to_spoke_2_peering" {
  description = "Hub to Spoke 2 VNet Peering"
  value       = azurerm_virtual_network_peering.hub_to_spoke_2.id
}

# ===============================
# Hub Virtual Network Outputs
# ===============================
output "out_hub_vnet_name" {
    value = azurerm_virtual_network.hub.name
}

output "out_hub_vnet_id" {
    value = azurerm_virtual_network.hub.id
}

# ===============================
# Hub Data Subnet Outputs
# ===============================
output "out_hub_data_subnet_name" {
    value = azurerm_subnet.hub_data.name
}

output "out_hub_data_subnet_id" {
    value = azurerm_subnet.hub_data.id
}

# ===============================
# Hub Firewall Subnet Outputs
# ===============================
output "out_fw_subnet_name" {
    value = azurerm_subnet.hub_firewall.name
}

output "out_fw_subnet_id" {
    value = azurerm_subnet.hub_firewall.id
}

# ===============================
# Spoke 1 Virtual Network Outputs
# ===============================
output "out_spoke1_vnet_name" {
    value = azurerm_virtual_network.spoke_1_vnet.name
}

output "out_spoke1_vnet_id" {
    value = azurerm_virtual_network.spoke_1_vnet.id
}

# ===============================
# Spoke 1 Subnet Outputs
# ===============================
output "out_spoke1_subnet_name" {
    value = azurerm_subnet.spoke_1_subnet.name
}

output "out_spoke1_subnet_id" {
    value = azurerm_subnet.spoke_1_subnet.id
}

# ===============================
# Spoke 2 Virtual Network Outputs
# ===============================
output "out_spoke2_vnet_name" {
    value = azurerm_virtual_network.spoke_2_vnet.name
}

output "out_spoke2_vnet_id" {
    value = azurerm_virtual_network.spoke_2_vnet.id
}

# ===============================
# Spoke 2 Subnet Outputs
# ===============================
output "out_spoke2_subnet_name" {
    value = azurerm_subnet.spoke_2_subnet.name
}

output "out_spoke2_subnet_id" {
    value = azurerm_subnet.spoke_2_subnet.id
}

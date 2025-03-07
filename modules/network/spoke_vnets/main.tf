# ===============================
# Spoke 1 Virtual Network
# ===============================
resource "azurerm_virtual_network" "spoke_1_vnet" {
  name                = var.spoke_1_vnet_name
  location            = var.spoke_locations["spoke1"]
  resource_group_name = var.spokes_resource_group_name
  address_space       = var.spoke_1_vnet_address_space
}

# ===============================
# Spoke 1 Subnet
# ===============================
resource "azurerm_subnet" "spoke_1_subnet" {
  name                 = var.spoke_1_subnet_name
  resource_group_name  = var.spokes_resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_1_vnet.name
  address_prefixes     = [var.spoke_1_subnet_prefix]
}

# ===============================
# Spoke 2 Virtual Network
# ===============================
resource "azurerm_virtual_network" "spoke_2_vnet" {
  name                = var.spoke_2_vnet_name
  location            = var.spoke_locations["spoke2"]
  resource_group_name = var.spokes_resource_group_name  
  address_space       = var.spoke_2_vnet_address_space
}

# ===============================
# Spoke 2 Subnet
# ===============================
resource "azurerm_subnet" "spoke_2_subnet" {
  name                 = var.spoke_2_subnet_name
  resource_group_name  = var.spokes_resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_2_vnet.name
  address_prefixes     = [var.spoke_2_subnet_prefix]
}

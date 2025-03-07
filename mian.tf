# Root main.tf

# =====================================================
# Random ID generation for unique suffix
# =====================================================
resource "random_id" "suffix" {
  byte_length = 4
}

# ===============================
# 1. Create Resource Group
# ===============================
# Defines the resource group to contain all other resources
resource "azurerm_resource_group" "global" {
  name     =  "${var.resource_group_name}-${random_id.suffix.hex}-rg"
  location = var.location
}

# ===============================
# 2. Create Hub Virtual Network
# ===============================
# Defines the Hub VNet for the network setup with subnets for data and firewall
module "hub_vnet" {
  source                        = "./modules/network/hub_vnet"
  resource_group_name           = azurerm_resource_group.global.name
  location                      = azurerm_resource_group.global.location
  hub_vnet_name                 ="${ var.hub_vnet_name}-${random_id.suffix.hex}"
  hub_vnet_address_space        = var.hub_vnet_address_space
  hub_data_subnet_name          = var.hub_data_subnet_name
  hub_data_address_prefixes     = var.hub_data_address_prefixes
  hub_firewall_subnet_name      = var.hub_firewall_subnet_name
  hub_firewall_address_prefixes = var.hub_firewall_address_prefixes
}

# ===============================
# 3. Create Spoke Virtual Networks
# ===============================
# Defines two spoke VNets and their subnets
module "spokes_vnet" {
  source = "./modules/network/spoke_vnets"

  spokes_resource_group_name       = azurerm_resource_group.global.name
  spoke_locations                  = var.spoke_locations
  spoke_1_vnet_name                = "${var.spoke_1_vnet_name}-${random_id.suffix.hex}"
  spoke_1_vnet_address_space       = var.spoke_1_vnet_address_space
  spoke_1_subnet_name              = var.spoke_1_subnet_name
  spoke_1_subnet_prefix            = var.spoke_1_subnet_prefix
  spoke_2_vnet_name                = "${var.spoke_2_vnet_name}-${random_id.suffix.hex}"
  spoke_2_vnet_address_space       = var.spoke_2_vnet_address_space
  spoke_2_subnet_name              = var.spoke_2_subnet_name
  spoke_2_subnet_prefix            = var.spoke_2_subnet_prefix
}

# ===============================
# 4. Create Firewall
# ===============================
# Defines the firewall resource with public IP and subnet integration
module "firewall" {
  source                    = "./modules/security/firewall"
  firewall_name             = "${var.firewall_name}-${random_id.suffix.hex}"
  resource_group_name       = azurerm_resource_group.global.name
  location                 = azurerm_resource_group.global.location
  public_ip_name           = "${var.public_ip_name}-${random_id.suffix.hex}"
  fw_subnet_id             = module.hub_vnet.out_fw_subnet_id
}

# ===============================
# 5. Create Network Peering
# ===============================
# Peers the Hub VNet with both Spokes VNets
module "network_peering" {
  source = "./modules/network/vnet_peering"

  resource_group_name      = azurerm_resource_group.global.name
  spoke_1_vnet_name        = module.spokes_vnet.out_spoke1_vnet_name
  spoke_1_vnet_id          = module.spokes_vnet.out_spoke1_vnet_id
  spoke_2_vnet_name        = module.spokes_vnet.out_spoke2_vnet_name
  spoke_2_vnet_id          = module.spokes_vnet.out_spoke2_vnet_id
  hub_vnet_name            = module.hub_vnet.out_hub_vnet_name
  hub_vnet_id              = module.hub_vnet.out_hub_vnet_id
  spoke_1_to_hub_name      = "spoke-1-to-hub-peering"
  hub_to_spoke_1_name      = "hub-to-spoke-1-peering"
  spoke_2_to_hub_name      = "spoke-2-to-hub-peering"
  hub_to_spoke_2_name      = "hub-to-spoke-2-peering"
}

# ===============================
# 6. Create Route Tables
# ===============================
# Defines the route tables for Spoke 1 and Spoke 2 with firewall integration
module "route-table-1" {
  source                = "./modules/Security/route_tables"
  resource_group_name   = azurerm_resource_group.global.name
  spoke1_location       = var.spoke_locations["spoke1"]
  route_table_name_1    = "${var.route_table_name_1}-${random_id.suffix.hex}"
  rt_subnet_id_1        = module.spokes_vnet.out_spoke1_subnet_id
  spoke2_location       = var.spoke_locations["spoke2"]
  route_table_name_2    = "${var.route_table_name_2}-${random_id.suffix.hex}"
  rt_subnet_id_2        = module.spokes_vnet.out_spoke2_subnet_id
  firewall_private_ip   = module.firewall.out_firewall_private_ip
}

# ===============================
# Route Table 1 Definition
# ===============================
# Define the route table 1
resource "azurerm_route_table" "rtable1" {
  name                = var.route_table_name_1
  location            = var.spoke1_location
  resource_group_name = var.resource_group_name

  route {
    name                   = "spoke1_route"
    address_prefix         = "192.168.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip
  }
}

# ===============================
# Route Table 1 Subnet Association
# ===============================
# Associate the route table with the subnet
resource "azurerm_subnet_route_table_association" "subnet_rt_1_association" {
  subnet_id      = var.rt_subnet_id_1
  route_table_id = azurerm_route_table.rtable1.id
}

# ===============================
# Route Table 2 Definition
# ===============================
# Define the route table 2
resource "azurerm_route_table" "rtable2" {
  name                = var.route_table_name_2
  location            = var.spoke2_location
  resource_group_name = var.resource_group_name

  route {
    name                   = "spoke2_route"
    address_prefix         = "172.16.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip
  }
}

# ===============================
# Route Table 2 Subnet Association
# ===============================
# Associate the route table with the subnet
resource "azurerm_subnet_route_table_association" "subnet_rt_2_association" {
  subnet_id      = var.rt_subnet_id_2
  route_table_id = azurerm_route_table.rtable2.id
}

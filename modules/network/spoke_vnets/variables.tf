# ===============================
# Spokes Resource Group
# ===============================
variable "spokes_resource_group_name" {
   description = "The spokes resource group name"
   type        = string
}

# ===============================
# Spoke Locations
# ===============================
variable "spoke_locations" {
  type        = map(string)
  description = "Map of locations for spoke networks"
  default = {
    spoke1 = "canadacentral"
    spoke2 = "centralus"
  }
}

# ===============================
# Spoke 1 Virtual Network
# ===============================
variable "spoke_1_vnet_name" {
  description = "The name of the spoke 1 virtual network"
  type        = string
}

variable "spoke_1_vnet_address_space" {
  description = "The address space for the spoke 1 virtual network"
  type        = list(string)
}

# ===============================
# Spoke 1 Subnet
# ===============================
variable "spoke_1_subnet_name" {  
  type = string
}

variable "spoke_1_subnet_prefix" {
  description = "The address prefix for the subnets in spoke 1 virtual network"
  type        = string
}

# ===============================
# Spoke 2 Virtual Network
# ===============================
variable "spoke_2_vnet_name" {
  description = "The name of the spoke 2 virtual network"
  type        = string
}

variable "spoke_2_vnet_address_space" {
  description = "The address space for the spoke 2 virtual network"
  type        = list(string)
}

# ===============================
# Spoke 2 Subnet
# ===============================
variable "spoke_2_subnet_name" {  
  type = string
}

variable "spoke_2_subnet_prefix" {
  description = "The address prefix for the subnets in spoke 2 virtual network"
  type        = string
}

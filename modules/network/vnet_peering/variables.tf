# ===============================
# Resource Group for Virtual Network Peering
# ===============================
variable "resource_group_name" {
  description = "The name of the resource group where the virtual network peering is created."
  type        = string
}

# ===============================
# Spoke 1 Virtual Network
# ===============================
variable "spoke_1_vnet_name" {
  description = "The name of the spoke 1 virtual network."
  type        = string
}

variable "spoke_1_vnet_id" {
  description = "The ID of the spoke 1 virtual network."
  type        = string
}

# ===============================
# Spoke 2 Virtual Network
# ===============================
variable "spoke_2_vnet_name" {
  description = "The name of the spoke 2 virtual network."
  type        = string
}

variable "spoke_2_vnet_id" {
  description = "The ID of the spoke 2 virtual network."
  type        = string
}

# ===============================
# Hub Virtual Network
# ===============================
variable "hub_vnet_name" {
  description = "The name of the hub virtual network."
  type        = string
}

variable "hub_vnet_id" {
  description = "The ID of the hub virtual network."
  type        = string
}

# ===============================
# Virtual Network Peerings
# ===============================
variable "spoke_1_to_hub_name" {
  description = "The name of the peering from spoke 1 to hub."
  type        = string
}

variable "hub_to_spoke_1_name" {
  description = "The name of the peering from hub to spoke 1."
  type        = string
}

variable "spoke_2_to_hub_name" {
  description = "The name of the peering from spoke 2 to hub."
  type        = string
}

variable "hub_to_spoke_2_name" {
  description = "The name of the peering from hub to spoke 2."
  type        = string
}

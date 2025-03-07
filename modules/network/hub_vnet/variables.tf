# ===============================
# Resource Group and Location
# ===============================
variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

# ===============================
# Hub VNet
# ===============================
variable "hub_vnet_name" {
  description = "The name of the Hub Virtual Network"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "The address space for the Hub Virtual Network"
  type        = list(string)
}

# ===============================
# Hub Data Subnet
# ===============================
variable "hub_data_subnet_name" {
  description = "The name of the data subnet in the Hub VNet"
  type        = string
}

variable "hub_data_address_prefixes" {
  description = "The address prefixes for the data subnet"
  type        = list(string)
}

# ===============================
# Hub Firewall Subnet
# ===============================
variable "hub_firewall_subnet_name" {
  description = "The name of the firewall subnet in the Hub VNet"
  type        = string
}

variable "hub_firewall_address_prefixes" {
  description = "The address prefixes for the firewall subnet"
  type        = list(string)
}

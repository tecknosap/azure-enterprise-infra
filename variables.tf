# ===============================
# Resource Group and Location
# ===============================
variable "resource_group_name" {
  description = "The name of the Azure resource group where resources will be deployed"
  type        = string
  default     = "tnk-rg"
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "EastUS"
}

# ===============================
# Hub VNet
# ===============================
variable "hub_vnet_name" {
  description = "The name of the Hub Virtual Network"
  type        = string
  default     = "tnk-vnet-hub"
}

variable "hub_vnet_address_space" {
  description = "The address space for the Hub Virtual Network"
  type        = list(string)
}

variable "hub_data_subnet_name" {
  description = "The name of the data subnet in the Hub VNet"
  type        = string
  default     = "tnk-subnet-data"
}

variable "hub_data_address_prefixes" {
  description = "The address prefixes for the data subnet"
  type        = list(string)
}

variable "hub_firewall_subnet_name" {
  description = "The name of the firewall subnet in the Hub VNet"
  type        = string
  default     = "AzureFirewallSubnet"
}

variable "hub_firewall_address_prefixes" {
  description = "The address prefixes for the firewall subnet"
  type        = list(string)
}

# ===============================
# Spoke 1 VNet
# ===============================
variable "spoke_1_vnet_name" {
  description = "The name of the spoke 1 virtual network"
  type        = string
  default     = "tnk-vnet-spoke1"
}

variable "spoke_1_vnet_address_space" {
  description = "The address space for the spoke 1 virtual network"
  type        = list(string)
}

variable "spoke_1_subnet_name" {  
  type = string
  default = "tnk-subnet-1"
}

variable "spoke_1_subnet_prefix" {
  description = "The address prefix for the subnets in spoke 1 virtual network"
  type        = string
}

# ===============================
# Spoke 2 VNet
# ===============================
variable "spoke_2_vnet_name" {
  description = "The name of the spoke 2 virtual network"
  type        = string
  default     = "tnk-vnet-spoke2"
}

variable "spoke_2_vnet_address_space" {
  description = "The address space for the spoke 2 virtual network"
  type        = list(string)
}

variable "spoke_2_subnet_prefix" {
  description = "The address prefix for the subnets in spoke 2 virtual network"
  type        = string
}

variable "spoke_2_subnet_name" {  
  type = string
  default = "tnk-subnet-2"
}

# ===============================
# Spoke Locations
# ===============================
variable "spoke_locations" {
  type = map(string)
  description = "Map of locations for spoke networks"
  default = {
    spoke1 = "CanadaCentral"
    spoke2 = "CentralUS"
  }
}

# ===============================
# Firewall
# ===============================
variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string
  default = "tnk-public-ip"
}

variable "firewall_name" {
  description = "The name of the firewall."
  type        = string
  default = "tnk-fw"
}

# ===============================
# Route Tables
# ===============================
variable "route_table_name_1" {
  description = "The name of the route table to be created."
  type        = string
  default = "tnk-rt-1"    
}

variable "route_table_name_2" {
  description = "The name of the route table to be created."
  type        = string
  default = "tnk-rt-2"    
}


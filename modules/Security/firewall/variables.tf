# ===============================
# Location for Resources
# ===============================
# Define the location for your resources
variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

# ===============================
# Resource Group Name
# ===============================
# Define the resource group name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# ===============================
# Firewall Subnet ID
# ===============================
variable "fw_subnet_id" {
  description = "Firewall subnet ID"
}

# ===============================
# Public IP for Firewall
# ===============================
# Define the public IP name
variable "public_ip_name" {
  description = "The name of the public IP address for the firewall"
  type        = string
}

# ===============================
# Firewall Name
# ===============================
# Define the firewall name
variable "firewall_name" {
  description = "The name of the Azure Firewall"
  type        = string
}

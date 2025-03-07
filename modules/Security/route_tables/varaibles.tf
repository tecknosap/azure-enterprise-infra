# ===============================
# Route Table Name 1
# ===============================
variable "route_table_name_1" {
  description = "The name of the route table"
  type        = string
}

# ===============================
# Route Table Name 2
# ===============================
variable "route_table_name_2" {
  description = "The name of the route table"
  type        = string
}

# ===============================
# Spoke 1 Location
# ===============================
variable "spoke1_location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

# ===============================
# Spoke 2 Location
# ===============================
variable "spoke2_location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

# ===============================
# Resource Group Name
# ===============================
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# ===============================
# Firewall Private IP
# ===============================
variable "firewall_private_ip" {
  description = "Private IP address of the firewall"
  type        = string
}

# ===============================
# Route Table Subnet ID 1
# ===============================
variable "rt_subnet_id_1" {
  description = "The ID of the subnet to associate the route table with"
  type        = string
}

# ===============================
# Route Table Subnet ID 2
# ===============================
variable "rt_subnet_id_2" {
  description = "The ID of the subnet to associate the route table with"
  type        = string
}

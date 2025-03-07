# Azure Hub-and-Spoke Network with Terraform

## Description

This repository contains Terraform configurations to deploy an Azure Hub-and-Spoke network architecture with direct Spoke-to-Spoke connectivity.

## Features

- Deploys a Hub VNet and two Spoke VNets.
- Configures VNet Peering between Hub and Spokes.
- Enables direct Spoke-to-Spoke communication.
- Deploys an Azure Firewall for network security.
- Sets up Route Tables for traffic routing.

## Prerequisites

- An active Azure subscription.
- Terraform installed.
- Azure CLI installed.
- Logged into Azure using `az login`.

## Deployment

### Clone the Repository

```bash
git clone <repository-url>
cd <repository-name>

Initialize Terraform

terraform init

Plan and Apply Configuration
terraform plan

terraform apply -auto-approve

File Structure

├── main.tf                 # Root Terraform configuration
├── variables.tf            # Input variables definition
├── modules/                # Modularized Terraform code
│   ├── network/            # Network-related configurations
│   │   ├── hub_vnet/       # Hub VNet module
│   │   ├── spoke_vnets/    # Spoke VNets module
│   │   ├── vnet_peering/   # VNet peering module
│   ├── security/           # Security-related configurations
│   │   ├── firewall/       # Firewall module
│   │   ├── route_tables/   # Route Tables module
├── README.md               # Documentation

Customization
Modify variables.tf to update resource names, regions, and CIDR blocks.

Troubleshooting
Ensure Azure credentials are properly configured.
Verify Terraform version compatibility.
Use terraform state list to debug state issues.

License
This project is licensed under the MIT License.
provider "azurerm" {
  version = "=2.20.0"
  features {}
}

module "az_resource_group" {
  source   = "../terraform-azure-resource-group"
  name     = "ankesh-workspace"
  location = "westeurope"
  team_tag = "DevOps"
  creator  = "ankesh"
}

module "az_virtual_network" {
  source              = "../terraform-azure-virtual-network"
  name                = "ankesh-vnet"
  resource_group_name = module.az_resource_group.az_rg_name
  address_space       = "10.0.2.0/24"
  env                 = "dev"
  team_tag            = "DevOps"
  creator             = "ankesh"
}

module "az_subnet" {
  source              = "../terraform-azure-subnet"
  name                = "ankesh-subnet-prod"
  resource_group_name = module.az_resource_group.az_rg_name
  vnet_name           = module.az_virtual_network.az_vnet_name
  address_prefix      = "10.0.2.0/26"
}

output "azure_resource_group_name" {
  value = module.az_resource_group.az_rg_name
}

output "azure_vnet_name" {
  value = module.az_virtual_network.az_vnet_name
}

output "azure_vnet_location" {
  value = module.az_virtual_network.az_vnet_location
}

output "azure_vnet_address_space" {
  value = module.az_virtual_network.az_vnet_address_space
}

output "azure_subnet_name" {
  value = module.az_subnet.az_subnet_name
}

output "azure_subnet_address_prefix" {
  value = module.az_subnet.az_subnet_address_prefix
}

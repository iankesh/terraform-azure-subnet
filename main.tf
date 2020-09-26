data "azurerm_resource_group" "azure_rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "azure_vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.azure_rg.name
}

resource "azurerm_subnet" "az_subnet" {
  name                 = var.name
  resource_group_name  = data.azurerm_resource_group.azure_rg.name
  virtual_network_name = data.azurerm_virtual_network.azure_vnet.name
  address_prefixes     = [var.address_prefix]
}

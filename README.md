# Terraform Modules
![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

Terraform modules for everything.

My Custom Terraform Modules [here](https://registry.terraform.io/namespaces/iankesh).

### Terraform Module to create Subnet in a Virtual Network in Microsoft Azure
#### Tools Used
- Terraform: Version 0.12.29
- Azurerm provider: Version v2.20.0

#### Parameters to pass
| Parameters | Need | Description
| ------ | ------ | ------ |
source |(Required)|source of this module
name|(Required)|name of the subnet
resource_group_name|(Required)|name of the Resorce Group
vnet_name|(Reqiured)|name of the Virtual Network
address_prefix|(Required)|address prefix of the subnet

#### Usage:
###### Import existing Resource Group and Virtual network
```sh
provider "azurerm" {
  version = "=2.20.0"
  features {}
}

module "az_subnet" {
  source              = "iankesh/subnet/azure"
  name                = "ankesh-subnet"
  resource_group_name = "ankesh-workspace"
  vnet_name           = "ankesh-vnet"
  address_prefix      = "10.0.2.0/26"
}
```

###### Create new Subnet using module
```sh
provider "azurerm" {
  version = "=2.20.0"
  features {}
}

module "az_resource_group" {
  source   = "iankesh/resource-group/azure"
  name     = "ankesh-workspace"
  location = "westeurope"
  team_tag = "DevOps"
  creator  = "ankesh"
}

module "az_virtual_network" {
  source              = "iankesh/virtual-network/azure"
  name                = "ankesh-vnet"
  resource_group_name = module.az_resource_group.az_rg_name
  address_space       = "10.0.2.0/24"
  env                 = "dev"
  team_tag            = "DevOps"
  creator             = "ankesh"
}

module "az_subnet" {
  source              = "iankesh/subnet/azure"
  name                = "ankesh-subnet"
  resource_group_name = module.az_resource_group.az_rg_name
  vnet_name           = module.az_virtual_network.az_vnet_name
  address_prefix      = "10.0.2.0/26"
}
```

#### Terraform Execution:
###### To initialize Terraform:
```sh
terraform init
```

###### To execute Terraform Plan:
```sh
terraform plan
```

###### To apply Terraform changes:
```sh
terraform apply
```

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons Licence" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

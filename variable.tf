variable "address_prefix" {
  description = "(Required) The address prefix that is used by the subnet."
  type        = string
  default     = "10.0.2.0/26"
}

variable "resource_group_name" {
  description = "(Required) The name of an existing resource group to be imported."
  type        = string
}

variable "vnet_name" {
  description = "(Required) The name of an existing virtual network to be imported."
  type        = string
}

variable "name" {
  description = "(Required) The name of the virtual network"
  default     = "cloud-subnet"
}

variable "env" {
  description = "(Optional) name of the environment"
  default     = "dev"
}

variable "team_tag" {
  description = "(Optional) tag a team"
  default     = "DevOps"
}

variable "creator" {
  description = "(Optional) tag a creator"
  default     = "iankesh"
}


variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where resources are to be deployed"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group where resources are to be deployed"
  default     = "uksouth"
}
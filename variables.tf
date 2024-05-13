# variables.tf
variable "resource_group_name" {
  description = "Name of the resource group where the resources will be deployed."
}

variable "app_service_name" {
  description = "Name of the Azure App Service."
}

variable "vnet_name" {
  description = "Name of the Virtual Network where the App Service will be deployed."
}

variable "subnet_name" {
  description = "Name of the Subnet within the Virtual Network."
}

variable "app_settings" {
  description = "Map of application settings to configure for the App Service."
}

variable "staging_slots" {
  description = "List of staging slots to create for the App Service."
  default     = []
}


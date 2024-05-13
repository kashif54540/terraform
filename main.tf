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

resource "azurerm_app_service" "main" {
  name                = var.app_service_name
  location            = azurerm_resource_group.main.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id
  site_config {
    always_on = true
  }
  app_settings = var.app_settings
}

resource "azurerm_app_service_slot" "staging" {
  count                 = length(var.staging_slots)
  name                  = var.staging_slots[count.index]
  resource_group_name   = var.resource_group_name
  app_service_name      = azurerm_app_service.main.name
  app_service_plan_id   = azurerm_app_service_plan.main.id
  location              = azurerm_resource_group.main.location
  app_settings          = var.app_settings
}

resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id       = azurerm_app_service.main.id
  vnet_resource_id     = azurerm_subnet.main.id
  swift_network_string = azurerm_subnet.main.address_prefixes[0]
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["https://url.uk.m.mimecastprotect.com/s/yiRkCx174hw6PyxF81ZlL?domain=10.0.1.0"]
}



# outputs.tf
output "app_service_id" {
  description = "ID of the deployed Azure App Service."
  value       = azurerm_app_service.main.id
}

output "app_service_url" {
  description = "URL of the deployed Azure App Service."
  value       = azurerm_app_service.main.default_site_hostname
}

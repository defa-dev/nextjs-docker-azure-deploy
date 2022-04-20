output "rg_name" {
  description = "Resource group name"
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  description = "Resource group location"
  value = azurerm_resource_group.rg.location
}

output "cr_adm_password" {
  description = "Container registry password"
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "cr_login_server" {
  description = "Container registry password"
  value = azurerm_container_registry.acr.login_server
}

output "cr_admin_username" {
  description = "Container registry password"
  value = azurerm_container_registry.acr.dmin_username
}
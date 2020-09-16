#
# Output Variables
#
output "azurerm_machine_learning_workspace_id" {
  value       = azurerm_machine_learning_workspace.mlws.id
  description = "The ID for the Machine Learning Workspace."
}

output "azurerm_machine_learning_workspace_spid" {
  value       = azurerm_machine_learning_workspace.mlws.identity[0].principal_id
  description = "The (Client) ID of the Service Principal."
}

output "azurerm_machine_learning_workspace_tenid" {
  value       = azurerm_machine_learning_workspace.mlws.identity[0].tenant_id
  description = "The ID of the Tenant the Service Principal is assigned in."
}

output "azurerm_container_registry_id" {
  value       = azurerm_container_registry.acr.id
  description = "The ID of the container registry."
}

output "azurerm_container_registry_login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "The URL that can be used to log into the container registry."
}

output "azurerm_container_registry_admin_username" {
  value       = azurerm_container_registry.acr.admin_username
  description = "The Username associated with the container registry Admin account."
}

output "azurerm_container_registry_admin_password" {
  value       = azurerm_container_registry.acr.admin_password
  description = "The Password associated with the container registry Admin account."
}
output "logic_app_principal_id" {
  value       = azurerm_logic_app_standard.logic_app.identity[0].principal_id
  description = "The Principal ID for the Service Principal associated with the Managed Service Identity of this App Service"
}

output "logic_app_private_ip" {
  value       = azurerm_private_endpoint.app.private_service_connection[0].private_ip_address
  description = "The private IP of the logic app created"
}
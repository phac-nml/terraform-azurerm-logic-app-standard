resource "azurerm_application_insights" "app" {
  name                = local.ai_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

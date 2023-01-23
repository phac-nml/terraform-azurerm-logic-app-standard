locals {
  # Logic app settings
  default_app_settings = {
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.app.connection_string
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.app.instrumentation_key
    "FUNCTIONS_WORKER_RUNTIME"              = "node"
    "WEBSITE_CONTENTOVERVNET"               = 1
    "WEBSITE_NODE_DEFAULT_VERSION"          = "~14"
    "RESOURCE_GROUP_NAME"                   = var.resource_group_name
    "SUBSCRIPTION_ID"                       = var.subscription_id
  }

  # Logic app site configs
  default_site_config = {
    always_on                        = false
    health_check_path                = "/"
    elastic_instance_minimum         = 1 // All of our logic apps are going to be elastic.
    runtime_scale_monitoring_enabled = true
  }

  app_settings = merge(local.default_app_settings, var.custom_logic_app_settings)
  site_config  = merge(local.default_site_config, var.custom_logic_app_site_config)
}
resource "azurerm_storage_share" "logic_app_file_share" {
  name                 = local.logic_app_name
  storage_account_name = var.storage_account_name
  quota                = 5120
  access_tier          = "TransactionOptimized"
}

resource "azurerm_logic_app_standard" "logic_app" {
  name = local.logic_app_name
  
  app_service_plan_id = var.app_service_plan_id
  location            = var.location
  resource_group_name = var.resource_group_name

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_key
  storage_account_share_name = azurerm_storage_share.logic_app_file_share.name

  version = var.logic_app_version

  virtual_network_subnet_id = var.snet_association_id
  app_settings              = local.app_settings
  
  site_config {
    always_on                        = lookup(local.site_config, "always_on", null)
    app_scale_limit                  = lookup(local.site_config, "app_scale_limit", null)
    dotnet_framework_version         = lookup(local.site_config, "dotnet_framework_version", null)
    ftps_state                       = lookup(local.site_config, "ftps_state", "Disabled")
    health_check_path                = lookup(local.site_config, "health_check_path", null)
    http2_enabled                    = lookup(local.site_config, "http2_enabled", null)
    runtime_scale_monitoring_enabled = lookup(local.site_config, "runtime_scale_monitoring_enabled", null)
    websockets_enabled               = lookup(local.site_config, "websockets_enabled", false)

    pre_warmed_instance_count = lookup(local.site_config, "pre_warmed_instance_count", null)
    elastic_instance_minimum  = lookup(local.site_config, "elastic_instance_minimum", null)

    vnet_route_all_enabled = lookup(local.site_config, "vnet_route_all_enabled", var.snet_association_id != null)

    dynamic "cors" {
      for_each = lookup(local.site_config, "cors", null) != null ? ["cors"] : []
      content {
        allowed_origins     = lookup(local.site_config.cors, "allowed_origins", [])
        support_credentials = lookup(local.site_config.cors, "support_credentials", false)
      }
    }
  }

  https_only              = var.https_only
  client_certificate_mode = var.client_certificate_mode

  dynamic "identity" {
    for_each = var.identity_type != null ? ["identity"] : []
    content {
      type = var.identity_type
      # Avoid perpetual changes if SystemAssigned and identity_ids is not null
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
  }

  tags = merge(var.extra_tags, var.logic_app_extra_tags)
}

resource "azurerm_private_endpoint" "app" {
  name                = "${local.pe_name}-${local.logic_app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.snet_private_endpoints_id

  private_service_connection {
    name                           = "psc-${local.logic_app_name}"
    private_connection_resource_id = azurerm_logic_app_standard.logic_app.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone.name
    private_dns_zone_ids = [var.private_dns_zone.id]
  }
}

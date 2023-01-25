locals {
  # Naming locals/constants
  name_prefix    = lower(var.name_prefix)
  name_suffix    = lower(var.name_suffix)
  logic_app_slug = "la"
  ai_app_slug    = "ai"
  logic_app_name = coalesce(var.custom_logic_app_name, azurecaf_name.logic_app_standard.result)
  ai_app_name    = coalesce(var.custom_ai_app_name, azurecaf_name.ai_app.result)
  pe_name        = coalesce(var.custom_pe_name, azurecaf_name.pe.result)
}

resource "azurecaf_name" "logic_app_standard" {
  name          = var.stack
  resource_type = "azurerm_logic_app_workflow"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.environment, local.name_suffix, var.use_caf_naming ? "" : local.logic_app_slug])
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}

resource "azurecaf_name" "ai_app" {
  name          = var.stack
  resource_type = "azurerm_application_insights"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, var.use_caf_naming ? "" : local.ai_app_slug])
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}

resource "azurecaf_name" "pe" {
  name          = var.stack
  resource_type = "azurerm_private_endpoint"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = var.name_suffix == "" ? null : [local.name_suffix]
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}
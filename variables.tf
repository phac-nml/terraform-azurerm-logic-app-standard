# General configs

variable "location" {
  type        = string
  description = "Azure region to use"
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
  default     = "cacentral"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID that the Logic app is deployed in"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to deploy to"
}

# Networking configs

variable "snet_private_endpoints_id" {
  type        = string
  description = "The subnet ID to deploy the private endpoints to"
}

variable "snet_association_id" {
  type        = string
  description = "The subnet ID to associate the app service to"
}

# Storage account configs

variable "storage_account_name" {
  type        = string
  description = "Storage account name for the Logic app to use"
}

variable "storage_account_connection_string" {
  type        = string
  description = "Storage account connection string for the Logic app to use"
}

variable "storage_account_key" {
  type        = string
  description = "Storage account key for the Logic app to use"
}

# Logic app configs

variable "app_service_plan_id" {
  type        = string
  description = "App service plan ID for the Logic app to use"
}

variable "custom_logic_app_settings" {
  type        = map(string)
  description = "A map of custom Logic app settings that are applied to the app configuration. These configs take precedence over the default settings defined in this module"
  default     = {}
}

variable "custom_logic_app_site_config" {
  type        = map(any)
  description = "Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. IP restriction attribute is not managed in this block."
  default     = {}
}

variable "logic_app_version" {
  type        = string
  description = "Logic apps require the Azure Functions runtime. The specified version fills the FUNCTIONS_EXTENSION_VERSION app setting."
  default     = "~4"
}

variable "https_only" {
  description = "Disable http procotol and keep only https"
  type        = bool
  default     = true
}

variable "client_certificate_mode" {
  description = "(Optional) The mode of the Logic app's client certificates requirement for incoming requests. Possible values are `Required` and `Optional`."
  type        = string
  default     = null
}

variable "identity_type" {
  description = "Add an Identity (MSI) to the Logic app. Possible values are SystemAssigned or UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "identity_ids" {
  description = "UserAssigned Identities ID to add to Logic app. Mandatory if type is UserAssigned"
  type        = list(string)
  default     = null
}

# Private DNS zone configuration

variable "private_dns_zone" {
  description = "The name and ID of the private link DNS zone in Azure to register the Private Endpoint resource type"
  type = object({
    name = string
    id   = string
  })
}

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >= 1.2.22 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | >= 1.2.22 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.30 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.ai_app](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.logic_app_standard](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.pe](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_application_insights.app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_logic_app_standard.logic_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/logic_app_standard) | resource |
| [azurerm_private_endpoint.app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_storage_share.logic_app_file_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_plan_id"></a> [app\_service\_plan\_id](#input\_app\_service\_plan\_id) | App service plan ID for the Logic app to use | `string` | n/a | yes |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | (Optional) The mode of the Logic app's client certificates requirement for incoming requests. Possible values are `Required` and `Optional`. | `string` | `null` | no |
| <a name="input_client_name"></a> [client\_name](#input\_client\_name) | Client name/account used in naming | `string` | n/a | yes |
| <a name="input_custom_ai_app_name"></a> [custom\_ai\_app\_name](#input\_custom\_ai\_app\_name) | Optional custom resource application insights name | `string` | `""` | no |
| <a name="input_custom_logic_app_name"></a> [custom\_logic\_app\_name](#input\_custom\_logic\_app\_name) | Optional custom resource Logic app name | `string` | `""` | no |
| <a name="input_custom_logic_app_settings"></a> [custom\_logic\_app\_settings](#input\_custom\_logic\_app\_settings) | A map of custom Logic app settings that are applied to the app configuration. These configs take precedence over the default settings defined in this module | `map(string)` | `{}` | no |
| <a name="input_custom_logic_app_site_config"></a> [custom\_logic\_app\_site\_config](#input\_custom\_logic\_app\_site\_config) | Site config for App Service. See documentation https://www.terraform.io/docs/providers/azurerm/r/app_service.html#site_config. IP restriction attribute is not managed in this block. | `map(any)` | `{}` | no |
| <a name="input_custom_pe_name"></a> [custom\_pe\_name](#input\_custom\_pe\_name) | Optional custom resource private endpoint name | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Project environment | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add | `map(string)` | `{}` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Disable http procotol and keep only https | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | UserAssigned Identities ID to add to Logic app. Mandatory if type is UserAssigned | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Add an Identity (MSI) to the Logic app. Possible values are SystemAssigned or UserAssigned | `string` | `"SystemAssigned"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region to use | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | Short string for Azure location. | `string` | `"cacentral"` | no |
| <a name="input_logic_app_extra_tags"></a> [logic\_app\_extra\_tags](#input\_logic\_app\_extra\_tags) | Extra tags to add to Logic app | `map(string)` | `{}` | no |
| <a name="input_logic_app_version"></a> [logic\_app\_version](#input\_logic\_app\_version) | Logic apps require the Azure Functions runtime. The specified version fills the FUNCTIONS\_EXTENSION\_VERSION app setting. | `string` | `"~4"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Optional prefix for the generated name | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Optional suffix for the generated name | `string` | `""` | no |
| <a name="input_private_dns_zone"></a> [private\_dns\_zone](#input\_private\_dns\_zone) | The name and ID of the private link DNS zone in Azure to register the Private Endpoint resource type | <pre>object({<br>    name = string<br>    id   = string<br>  })</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to deploy to | `string` | n/a | yes |
| <a name="input_snet_association_id"></a> [snet\_association\_id](#input\_snet\_association\_id) | The subnet ID to associate the app service to | `string` | n/a | yes |
| <a name="input_snet_private_endpoints_id"></a> [snet\_private\_endpoints\_id](#input\_snet\_private\_endpoints\_id) | The subnet ID to deploy the private endpoints to | `string` | n/a | yes |
| <a name="input_stack"></a> [stack](#input\_stack) | Project stack name | `string` | n/a | yes |
| <a name="input_storage_account_connection_string"></a> [storage\_account\_connection\_string](#input\_storage\_account\_connection\_string) | Storage account connection string for the Logic app to use | `string` | n/a | yes |
| <a name="input_storage_account_key"></a> [storage\_account\_key](#input\_storage\_account\_key) | Storage account key for the Logic app to use | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name for the Logic app to use | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID that the Logic app is deployed in | `string` | n/a | yes |
| <a name="input_use_caf_naming"></a> [use\_caf\_naming](#input\_use\_caf\_naming) | Use the Azure CAF naming provider to generate default resource name. `custom_rg_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logic_app_principal_id"></a> [logic\_app\_principal\_id](#output\_logic\_app\_principal\_id) | The Principal ID for the Service Principal associated with the Managed Service Identity of this App Service |
| <a name="output_logic_app_private_ip"></a> [logic\_app\_private\_ip](#output\_logic\_app\_private\_ip) | The private IP of the logic app created |
<!-- END_TF_DOCS -->
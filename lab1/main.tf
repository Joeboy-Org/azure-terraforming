data "azurerm_client_config" "current" {}

resource "random_string" "keyvault_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "azurerm_key_vault" "main" {
  name                      = "kv-${var.application_name}-${var.environment_name}-${random_string.keyvault_suffix.result}"
  location                  = azurerm_resource_group.main.location
  resource_group_name       = azurerm_resource_group.main.name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  enable_rbac_authorization = true
  purge_protection_enabled  = false
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "diag-${var.application_name}-${var.environment_name}-${random_string.keyvault_suffix.result}"
  target_resource_id         = azurerm_key_vault.main.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.observability.id

  enabled_log {
    category = "AuditEvent"
  }

  metric {
    category = "AllMetrics"
  }
}
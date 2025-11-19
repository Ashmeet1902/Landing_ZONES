resource "azurerm_key_vault" "key" {
    name                        = var.key_vault.name
    location                    = var.key_vault.location
    resource_group_name         = var.key_vault.resource_group_name
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    sku_name                    = var.key_vault.sku_name
    purge_protection_enabled    = var.key_vault.purge_protection_enabled
    soft_delete_retention_days  = var.key_vault.soft_delete_retention_days
    enabled_for_disk_encryption = var.key_vault.enabled_for_disk_encryption
    tags                        = var.key_vault.tags

access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id


        key_permissions = [
        "Get",
        "List",
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Purge",
      "Backup",
      "Delete",
      "Restore",
      "Restore"]
    storage_permissions = [
      "Get",
      "Set",
      "List"
    ]
    }               
}


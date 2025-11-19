data "azurerm_key_vault" "key" {
    for_each = var.key_vaults_secrets
    name                = each.value.name
    resource_group_name = each.value.resource_group_name
    }
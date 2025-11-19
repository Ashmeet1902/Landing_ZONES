data "azurerm_network_interface" "nic" {
    for_each = var.vms
    name                = each.value.nic_name
    resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "key_vault" {
    for_each = var.vms
    name                = each.value.key_vault_name
    resource_group_name = each.value.key_vault_resource_group_name
  
}
data "azurerm_key_vault_secret" "admin_username" {
    for_each = var.vms
    name         = each.value.key_vault_secret_admin_username
    key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
  
}
data "azurerm_key_vault_secret" "admin_password" {
    for_each = var.vms
    name         = each.value.key_vault_secret_admin_password
    key_vault_id = data.azurerm_key_vault.key_vault[each.key].id
  
}
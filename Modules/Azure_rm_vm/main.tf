resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vms
    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    network_interface_ids = [
        data.azurerm_network_interface.nic[each.key].id
    ]
    size                = each.value.size
    admin_username      = data.azurerm_key_vault_secret.admin_username[each.key].value
    admin_password      = data.azurerm_key_vault_secret.admin_password[each.key].value
    disable_password_authentication = false
    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher = each.value.source_image_reference.publisher
      offer     = each.value.source_image_reference.offer
      sku       = each.value.source_image_reference.sku
      version   = each.value.source_image_reference.version
    }
    tags = each.value.tags
  
}
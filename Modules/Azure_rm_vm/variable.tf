variable "vms" {
    description = "A map of virtual machines to create"
    type = map(object({
        name                  = string
        location              = string
        resource_group_name   = string
        nic_name              = string
        size                  = string
        admin_username        = string
        admin_password        = string
        key_vault_name        = string
        key_vault_resource_group_name = string
        key_vault_secret_admin_username = string
        key_vault_secret_admin_password = string
        source_image_reference = object({
            publisher = string
            offer     = string
            sku       = string
            version   = string
        })
        tags                  = map(string)
    }))
  
}
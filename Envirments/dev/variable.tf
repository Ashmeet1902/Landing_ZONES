variable "public_ip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
    tags                = map(string)
  }))

}
variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
    subnet = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), )
  }))

}
variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))

}
variable "nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    public_ip_name      = string
    subnet_name         = string
    tags                = map(string)
    vnet_name           = string
  }))

}
variable "vms" {
  description = "A map of virtual machines to create"
  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    nic_name                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    key_vault_name                  = string
    key_vault_resource_group_name   = string
    key_vault_secret_admin_username = string
    key_vault_secret_admin_password = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    tags = map(string)
  }))

}
variable "key_vault" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string

    purge_protection_enabled    = optional(bool, false)
    soft_delete_retention_days  = optional(number, 7)
    enabled_for_disk_encryption = optional(bool, false)
    tags                        = map(string)
  })

}
variable "key_vaults_secrets" {
  type = map(object({
    name                = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))

}
variable "network_security_groups" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    subnet_name          = string
    virtual_network_name = string
    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })), )
    tags = map(string)
  }))

}
# variable "bastion_subnets" {
#   type = map(object({
#     subnet_name          = string
#     resource_group_name  = string
#     vnet_name            = string
#     address_prefixes     = list(string)
#     host_name            = string
#     location             = string
#     tags                 = map(string)
#     bastion_public_ip    = string
#     public_ip_address_id = string
#   }))

# }
variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}
variable "sql_servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    tags                         = map(string)
  }))

}
variable "sql_databases" {
  type = map(object({
    name                = string
    server_name         = string
    resource_group_name = string
    sku_name            = string
    max_size_gb         = string
    zone_redundant      = bool
    tags                = map(string)
  }))

}
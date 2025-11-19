variable "key_vault" {
  type = object({
    name                        = string
    location                    = string
    resource_group_name         = string
    sku_name                    = string

    purge_protection_enabled    = optional(bool, false)
    soft_delete_retention_days  = optional(number, 7)
    enabled_for_disk_encryption = optional(bool, false)
    tags                        = map(string)
  })
}

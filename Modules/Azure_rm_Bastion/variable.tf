variable "bastion_subnets" {
    type = map(object({
        subnet_name         = string
        resource_group_name = string
        vnet_name           = string
        address_prefixes    = list(string)
        host_name           = string
        location            = string
        tags                = map(string)
        bastion_public_ip    = string
        public_ip_address_id  = string
    }))
  
}
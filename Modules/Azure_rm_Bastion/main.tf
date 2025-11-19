resource "azurerm_subnet" "bastion_subnet" {
    for_each = var.bastion_subnets
    name                 = each.value.subnet_name
    resource_group_name  = each.value.resource_group_name
    virtual_network_name = data.azurerm_virtual_network.vnet[each.key].name
    address_prefixes     = each.value.address_prefixes
  
}
resource "azurerm_bastion_host" "bastion_host" {
    for_each = var.bastion_subnets
    name                = each.value.host_name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    ip_configuration {
      name                 = "bastionIpConfig"
      subnet_id            = azurerm_subnet.bastion_subnet[each.key].id
      public_ip_address_id = each.value.public_ip_address_id
    }
    tags = each.value.tags
  
}
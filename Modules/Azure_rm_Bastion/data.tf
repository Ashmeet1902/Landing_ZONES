data "azurerm_virtual_network" "vnet" {
    for_each = var.bastion_subnets
    name                = each.value.vnet_name
    resource_group_name = each.value.resource_group_name
}
# data "azurerm_public_ip" "bastion_public_ip" {
#     for_each = var.bastion_subnets
#     name                = each.value.bastion_public_ip 
#     resource_group_name = each.value.resource_group_name
# }
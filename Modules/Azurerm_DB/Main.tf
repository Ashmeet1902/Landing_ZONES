resource "azurerm_mssql_database" "name" {
    for_each = var.sql_databases
        name               = each.value.name
        server_id          = data.azurerm_mssql_server.name[each.key].id
        sku_name          = each.value.sku_name
        max_size_gb       = each.value.max_size_gb
        zone_redundant    = each.value.zone_redundant
        tags              = each.value.tags
  
}
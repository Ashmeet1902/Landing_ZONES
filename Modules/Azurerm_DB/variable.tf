variable "sql_databases" {
    type = map(object({
      name = string
        server_name = string
        resource_group_name = string
        sku_name = string
        max_size_gb = string
        zone_redundant = bool
        tags = map(string) 
    }))
  
}
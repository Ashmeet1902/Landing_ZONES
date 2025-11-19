variable "key_vaults_secrets" {
  type = map(object({
    name                = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))
  
}
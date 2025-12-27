public_ip = {
  "pip1" = {
    name                = "mypip1"
    location            = "Central India"
    resource_group_name = "myResourceGroup"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
    }

  }
  pip2 = {
    name                = "mypip2"
    location            = "Central India"
    resource_group_name = "myResourceGroup"
    allocation_method   = "Dynamic"
    sku                 = "Basic"
    tags = {
      environment = "dev"
    }

  }
  pip3 = {
    name                = "mypip3"
    location            = "Central India"
    resource_group_name = "myResourceGroup"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "dev"
    }

  }
}
vnets = {
  "vnet1" = {
    name                = "myVnet1"
    location            = "Central India"
    resource_group_name = "myResourceGroup"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnet = [
      {
        name             = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
    ]
  }
  vnet2 = {
    name                = "myVnet2"
    location            = "Central India"
    resource_group_name = "myResourceGroup2"
    address_space       = ["20.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnet = [
      {
        name             = "subnet2"
        address_prefixes = ["20.0.1.0/24"]
      }
    ]
  }
}

rgs = {
  "rg1" = {
    name     = "myResourceGroup"
    location = "Central India"
    tags = {
      environment = "dev"
    }

  }
  rg2 = {
    name     = "myResourceGroup2"
    location = "Central India"
    tags = {
      environment = "dev"
    }

  }
}
nics = {
  "nic1" = {
    name                = "myNic1"
    location            = "Central India"
    resource_group_name = "myResourceGroup"
    subnet_name         = "subnet1"
    vnet_name           = "myVnet1"
    public_ip_name      = "mypip2"
    tags = {
      environment = "dev"
    }

  }
  nic2 = {
    name                = "myNic2"
    location            = "Central India"
    resource_group_name = "myResourceGroup"
    subnet_name         = "subnet1"
    vnet_name           = "myVnet1"
    public_ip_name      = "mypip3"
    tags = {
      environment = "dev"
    }

  }
}
vms = {
  "vm1" = {
    name                            = "myVM1"
    location                        = "Central India"
    resource_group_name             = "myResourceGroup"
    nic_name                        = "myNic1"
    size                            = "Standard_B1s"
    admin_username                  = "adminuser"
    admin_password                  = "P@ssw0rd1234!"
    key_vault_name                  = "ashmeetkeyvault007"
    key_vault_resource_group_name   = "myResourceGroup"
    key_vault_secret_admin_username = "username"
    key_vault_secret_admin_password = "password"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
    tags = {
      environment = "dev"
    }

  }
  vm2 = {
    name                            = "myVM2"
    location                        = "Central India"
    resource_group_name             = "myResourceGroup"
    nic_name                        = "myNic2"
    size                            = "Standard_B2s"
    admin_username                  = "adminuser2"
    admin_password                  = "P@ssw0rd5678!"
    key_vault_name                  = "ashmeetkeyvault007"
    key_vault_resource_group_name   = "myResourceGroup"
    key_vault_secret_admin_username = "username"
    key_vault_secret_admin_password = "password"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
    tags = {
      environment = "dev"
    }

  }
}
key_vault = {
  name                        = "ashmeetkeyvault007"
  location                    = "Central India"
  resource_group_name         = "myResourceGroup"
  sku_name                    = "standard"
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7
  enabled_for_disk_encryption = false
  tags = {
    environment = "dev"
  }

}
key_vaults_secrets = {
  "secret1" = {
    name                = "ashmeetkeyvault007"
    resource_group_name = "myResourceGroup"
    secret_name         = "username"
    secret_value        = "adminuser"
  }
  secret2 = {
    name                = "ashmeetkeyvault007"
    resource_group_name = "myResourceGroup"
    secret_name         = "password"
    secret_value        = "Trigger.121223"
  }
}
network_security_groups = {
  "nsg1" = {
    name                 = "myNSG1"
    resource_group_name  = "myResourceGroup"
    location             = "Central India"
    subnet_name          = "subnet1"
    virtual_network_name = "myVnet1"
    security_rules = [
      {
        name                       = "AllowSSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = {
      environment = "dev"

    }
  }
}
# bastion_subnets = {
#   "bastion1" = {
#     subnet_name         = "AzureBastionSubnet"
#     resource_group_name = "myResourceGroup"
#     vnet_name           = "myVnet1"
#     address_prefixes    = ["10.0.2.0/24"]
#     host_name           = "myBastionHost1"
#     location            = "Central India"
#     tags = {
#       environment = "dev"
#     }
#     bastion_public_ip = "mypip1"
#   }
# }
storage_accounts = {
  "st1" = {
    name                     = "sonamguptadevsaashmeet"
    resource_group_name      = "myResourceGroup"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
    }

  }
}
sql_servers = {
  "server1" = {
    name                         = "sqlserverdevashmeet"
    resource_group_name          = "myResourceGroup"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "SqlP@ssw0rd1234!"
    tags = {
      environment = "dev"
    }

  }
}
sql_databases = {
  "DB1" = {
    name                             = "sqldbdevashmeet"
    resource_group_name              = "myResourceGroup"
    location                         = "Central India"
    server_name                      = "sqlserverdevashmeet"
    edition                          = "Basic"
    zone_redundant                   = false
    sku_name                         = "Basic"
    max_size_gb                      = "2"
    requested_service_objective_name = "Basic"
    tags = {
      environment = "dev"
    }

  }
}
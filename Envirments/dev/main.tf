locals {
  bastion_subnets = {
    "bastion1" = {
      subnet_name         = "AzureBastionSubnet"
      resource_group_name = "myResourceGroup"
      vnet_name           = "myVnet1"
      address_prefixes    = ["10.0.2.0/24"]
      host_name           = "myBastionHost1"
      location            = "Central India"
      tags = {
        environment = "dev"
      }
      bastion_public_ip    = "mypip1"
      public_ip_address_id = module.pip.azurerm_public_ip["pip1"]
    }
  }
}

module "rg" {
  source = "../../Modules/Azure_rm_rg"
  rgs    = var.rgs

}

module "pip" {
  depends_on = [module.rg]
  source     = "../../Modules/Azure_rm_pip"
  public_ip  = var.public_ip
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../Modules/Azure_rm_networking"
  vnets      = var.vnets

}
module "nic" {
  depends_on = [module.rg, module.vnet, module.pip]
  source     = "../../Modules/Azure_rm_nic"
  nics       = var.nics

}
module "key_vault" {
  depends_on = [module.rg]
  source     = "../../Modules/Azure_rm_Key_Vault"
  key_vault  = var.key_vault

}
module "key_secrets" {
  depends_on         = [module.key_vault]
  source             = "../../Modules/Azure_rm_key_Secrets"
  key_vaults_secrets = var.key_vaults_secrets

}
module "nsg" {
  depends_on              = [module.vnet]
  source                  = "../../modules/azure_rm_NSG"
  network_security_groups = var.network_security_groups

}
module "vms" {
  depends_on = [module.nic, module.key_secrets]
  source     = "../../Modules/Azure_rm_vm"
  vms        = var.vms

}
module "bastion" {
  depends_on      = [module.rg, module.vnet, module.pip]
  source          = "../../Modules/Azure_rm_Bastion"
  bastion_subnets = local.bastion_subnets

}

module "storage_accounts" {
  depends_on       = [module.rg]
  source           = "../../Modules/Azure_rm_storage_acc"
  storage_accounts = var.storage_accounts

}


terraform {
    required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
        }
    } 
}

provider "azurerm" {
    features {}
    subscription_id = var.xsubscription
}

resource "azurerm_resource_group" "tfrg" {
    name = var.xresource_group_name
    location = var.xlocation
}

module "mod_vnet" {
    source = "./modules/virtual_network"
    vnet_name = var.xvnet_name
    vnet_scope = [var.xvnet_scope[0]]
    vnet_location = azurerm_resource_group.tfrg.location
    vnet_rg = azurerm_resource_group.tfrg.name
    vnet_subnet_name = var.xvnet_subnet_name
    vnet_scope_subnet = [var.xvnet_scope_subnet[0]]
}

module "mod_nsg" {
    source = "./modules/nsg"
    nsg_name = var.xnsg_name
    nsg_location = azurerm_resource_group.tfrg.location
    nsg_rg = azurerm_resource_group.tfrg.name
}

resource "azurerm_subnet_network_security_group_association" "tfnsg2tfsubnet" {
    subnet_id = module.mod_vnet.output_subnet
    network_security_group_id = module.mod_nsg.output_nsg
}

variable "admin_password" {
    description = "Admin User"
}
variable "admin_username" {
    description = "Admin Password"
}

module "mod_vm" {
    source = "./modules/instances"
    tfvnet_publicip_name = var.xtfvnet_publicip_name
    tfvnet_nic_name = var.xtfvnet_nic_name
    tfvnet_nic_location = azurerm_resource_group.tfrg.location
    tfvnet_nic_rg = azurerm_resource_group.tfrg.name
    tfvnet_ip_name = var.xtfvnet_ip_name
    tfvnet_ip_subnet_id = module.mod_vnet.output_subnet
    tfvm_name = var.xtfvm_name
    tfvm_size = var.xtfvm_size
    tfvm_disk_os_name = var.xtfvm_disk_os_name
    tfos_image_publisher = var.xtfos_image_publisher
    tfos_image_offer = var.xtfos_image_offer
    tfos_image_sku = var.xtfos_image_sku
    admin_password = var.admin_password
    admin_username = var.admin_username
}
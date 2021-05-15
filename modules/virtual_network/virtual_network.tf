terraform {
    required_version = ">= 0.15"
}

resource "azurerm_virtual_network" "tfvnet" {
    name = var.vnet_name
    address_space = var.vnet_scope
    location = var.vnet_location
    resource_group_name = var.vnet_rg
}

resource "azurerm_subnet" "tfsubnet" {
  name                 = var.vnet_subnet_name
  resource_group_name  = azurerm_virtual_network.tfvnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.tfvnet.name
  address_prefixes     = [var.vnet_scope_subnet[0]]
}
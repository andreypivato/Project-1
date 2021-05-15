output "output_vnet" {
    value = azurerm_virtual_network.tfvnet.id
}

output "output_subnet" {
    value = azurerm_subnet.tfsubnet.id
}
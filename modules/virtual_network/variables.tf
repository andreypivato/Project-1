variable "vnet_name" {
    type = string
    description = "Vnet Name"
}
variable "vnet_scope" {
    description = "Vnet CIDR"
}
variable "vnet_location" {
    type = string
    description = "Vnet Location"
}
variable "vnet_rg" {
    type = string
    description = "Resource Group"
}
variable "vnet_subnet_name" {
    type = string
    description = "Subnet Name"
  
}
variable "vnet_scope_subnet" {
    description = "Subnet CIDR"
}
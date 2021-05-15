#Global
variable "xsubscription" {
    description = "Subscription ID"
}
variable "xresource_group_name" {
    type = string
    description = "Resource Group"
}
variable "xlocation" {
    type = string
    description = "Region and Location"
}

#Virtual Network
variable "xvnet_name" {
    type = string
    description = "Virtual Network Name"
}
variable "xvnet_scope" {
    description = "Scope Vnet CIDR"
}
variable "xvnet_subnet_name" {
    type = string
    description = "Subnet Name"
}
variable "xvnet_scope_subnet" {
    description = "Subnet Scope CIDR"
}

#NSG
variable "xnsg_name" {
    type = string
    description = "NSG Name"
}

#Virtual Machine
variable "xtfvnet_publicip_name" {
    type = string
    description = "Public IP Name"
}
variable "xtfvnet_nic_name" {
    type = string
    description = "Nic Name"
}
variable "xtfvnet_ip_name" {
    type = string
    description = "Nic Config Name"
}
variable "xtfvm_name" {
    type = string
    description = "Virtual Machine Name"
}
variable "xtfvm_size" {
    type = string
    description = "Virtual Machine SKU"
}
variable "xtfvm_disk_os_name" {
    type = string
    description = "OS Disk Name"
}
variable "xtfos_image_publisher" {
    type = string
    description = "OS Publisher"
}
variable "xtfos_image_offer" {
    type = string
    description = "Name of ImageOS"
}
variable "xtfos_image_sku" {
    type = string
    description = "OS Version"
}
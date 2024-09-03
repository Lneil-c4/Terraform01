variable "resource_group_name" {
  description = "Resource Group name"
}

variable "location" {
  description = "Azure Services Location"
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  //default = null
}

variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
}

variable "vnet_subnets_name" {
  description = "Subnet Name"
  type        = list(string)
}
variable "vnet_subnets_prefixes" {
  description = "Virtual Network Subnet"
  type        = list(string)
}

variable "vm_names" {
  description = "Virtual Machine Name"
  type        = list(string)
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
}

variable "vmusername" {
  description = "Virtual Machine User Name"
  type        = string
}

variable "vmpassword" {
  description = "password"
  sensitive   = true
  type        = string
}

variable "nic_ids" {
  description = "NIC Ids"
  type        = map(string)
}

variable "os_disk_size" {
  description = "OS Disk Size"
  type        = string
}

variable "tags" {
  description = "Tags of Azure Resources"
  type        = map(string)
}

variable "nsg_rules" {
  description = "NSG rules"
  type = object({
    rule1 = map(string)
    rule2 = map(string)
  })
}
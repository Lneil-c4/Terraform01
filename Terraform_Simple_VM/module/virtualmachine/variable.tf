variable "resource_group_name" {
  description = "Resource Group name"
}

variable "location" {
  description = "Azure Services Location"
}

variable "vm_names" {
  description = "Virtual Machine Name"
  type        = list(string)
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string

  validation {
    condition     = contains(["Standard_DS1_v2"], var.vm_size)
    error_message = "the size of the vm must be Standard_DS1_v2"
  }
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

variable "nic_ids" { #used for NIC
  description = "NIC Ids"
  type        = list(string)
}

variable "os_disk_size" {
  description = "OS Disk Size"
  type = string
}

variable "tags" {
  description = "Tags of Azure Resources"
  type = map(string)
}
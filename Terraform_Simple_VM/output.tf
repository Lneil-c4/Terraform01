output "nic_subnet" {
  value = { for nic in azurerm_network_interface.vm_nic : nic.name => nic.ip_configuration[0].subnet_id }
}

output "vm_names_out" {
  value = [for vm in module.primary_vm : vm.vm_names_out]
}

output "OS_Disk_name" {
  value = [for vm in module.primary_vm : vm.disk_name]
}
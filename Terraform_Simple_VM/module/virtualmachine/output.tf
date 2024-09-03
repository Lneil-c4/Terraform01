output "vm_names_out" {
  value = [for vm in azurerm_windows_virtual_machine.primary_vm : vm.name]
}

output "disk_name" {
  value = [for vm in azurerm_windows_virtual_machine.primary_vm : vm.os_disk[0].name]
}
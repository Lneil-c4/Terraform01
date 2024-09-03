module "primary_vm" {
  source              = "./module/virtualmachine"
  for_each            = toset(var.vm_names)
  vm_names            = [each.key]
  resource_group_name = azurerm_resource_group.primary_resource_group.name
  location            = azurerm_resource_group.primary_resource_group.location
  vm_size             = var.vm_size
  vmusername          = var.vmusername
  vmpassword          = var.vmpassword

  nic_ids = [azurerm_network_interface.vm_nic[each.key].id]

  os_disk_size = var.os_disk_size
  tags         = var.tags
}


/*resource "azurerm_windows_virtual_machine" "primary_vm" {
  for_each            = toset(var.vm_names)
  name                = each.key
  resource_group_name = azurerm_resource_group.primary_resource_group.name
  location            = azurerm_resource_group.primary_resource_group.location
  size                = var.vm_size
  admin_username      = var.vmusername
  admin_password      = var.vmpassword

  network_interface_ids = [azurerm_network_interface.vm_nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}*/
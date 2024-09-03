resource "azurerm_windows_virtual_machine" "primary_vm" {
  for_each            = toset(var.vm_names)
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vmusername
  admin_password      = var.vmpassword

  //network_interface_ids = [azurerm_network_interface.vm_nic[each.key].id]
  network_interface_ids = var.nic_ids

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = var.os_disk_size
    
  }

  lifecycle {
    prevent_destroy = true
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = var.tags
}
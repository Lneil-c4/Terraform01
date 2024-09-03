/*resource "azurerm_network_interface" "vm_nic" {
  for_each            = toset(var.vm_names)
  name                = "nic-${each.key}"
  location            = azurerm_resource_group.primary_resource_group.location
  resource_group_name = azurerm_resource_group.primary_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.primary_vnet_subnets["subneta"].id
    private_ip_address_allocation = "Dynamic"
  }
}*/

resource "azurerm_network_interface" "vm_nic" {
  for_each            = var.nic_ids
  name                = "nic-${each.key}"
  location            = azurerm_resource_group.primary_resource_group.location
  resource_group_name = azurerm_resource_group.primary_resource_group.name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.primary_vnet_subnets[each.value].id
    private_ip_address_allocation = "Dynamic"
  }
}

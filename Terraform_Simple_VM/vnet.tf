resource "azurerm_virtual_network" "primary_vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.primary_resource_group.location
  resource_group_name = azurerm_resource_group.primary_resource_group.name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "primary_vnet_subnets" {
  for_each             = zipmap(var.vnet_subnets_name, var.vnet_subnets_prefixes)
  resource_group_name  = azurerm_resource_group.primary_resource_group.name
  virtual_network_name = azurerm_virtual_network.primary_vnet.name
  address_prefixes     = [each.value]
  name                 = each.key
}
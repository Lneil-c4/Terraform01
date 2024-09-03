resource "azurerm_network_security_group" "nsg" {
  resource_group_name = azurerm_resource_group.primary_resource_group.name
  name                = "subnet-NSG"
  location            = azurerm_resource_group.primary_resource_group.location
  tags                = var.tags
}

resource "azurerm_network_security_rule" "example" {
  for_each                    = var.nsg_rules
  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.primary_resource_group.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "example" {
  for_each                  = azurerm_subnet.primary_vnet_subnets
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
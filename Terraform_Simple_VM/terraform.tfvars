location              = "EastUS2"
resource_group_name   = "test_rg"
vnet_address_space    = ["10.0.0.0/16"]
vnet_subnets_name     = ["subneta", "subnetb", "subnetc"]
vnet_subnets_prefixes = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
virtual_network_name  = "primary_vnet"
vm_names              = ["eusvm001", "eusvm002"]
#vm_names              = ["eusvm001", "eusvm002", "eusvm003"]
vm_size    = "Standard_DS1_v2"
vmusername = "testuser"
vmpassword = "P@ssw0rd21_"

nic_ids = {
  "eusvm001" = "subneta",
  "eusvm002" = "subneta",
  //"eusvm003" = "subnetc"
}

os_disk_size = "130"

tags = {
  "Task" = "Terraform-IaC"
}

nsg_rules = {
  rule1 = {
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  rule2 = {
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



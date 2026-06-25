resource "azurerm_network_interface" "nic" {
  for_each = var.vnic

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.subnet
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}
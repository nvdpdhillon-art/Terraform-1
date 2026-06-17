resource "azurerm_subnet_network_security_group_association" "subnetass" {
  for_each                  = var.vnsgass
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
}
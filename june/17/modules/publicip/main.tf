resource "azurerm_public_ip" "devvetpublicip" {
    for_each = var.vpublicip
  name                = "${var.vprefix}-${each.value.name}"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}
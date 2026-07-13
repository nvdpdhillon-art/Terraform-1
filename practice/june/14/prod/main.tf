resource "azurerm_resource_group" "rgs" {
    for_each = var.vrgs
    name = "${var.vprefix}-${each.value.name}"
    location = each.value.location
    tags = each.value.tags

}
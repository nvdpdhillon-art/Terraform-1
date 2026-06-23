output "rgid" {
  value = {
    for k, rgs in azurerm_resource_group.rgs :
    k => {
      id   = rgs.id
      name = rgs.name
    }
  }
}
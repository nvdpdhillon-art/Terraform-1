output "subnetid" {
  value = {
    for k, subnet in azurerm_subnet.subnet :
    k => {
      id   = subnet.id
      name = subnet.name
    }
  }
}

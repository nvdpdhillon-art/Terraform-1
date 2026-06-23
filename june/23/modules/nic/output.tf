output "nics" {
  value = {
    for k, nic in azurerm_network_interface.nic :
    k => {
      id   = nic.id
      name = nic.name
    }
  }
}
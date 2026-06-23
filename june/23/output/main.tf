resource "azurerm_resource_group" "rgs" {
    name        = "navi_rg"
    location    = "japanwest"
    tags = {
        req = "trying output block"
    }
}
resource "azurerm_virtual_network" "vnet" {
    name                    = "nav_vnet"
    location                = "japanwest"
    resource_group_name     = azurerm_resource_group.rgs.name
    address_space           = ["10.0.0.0/24"]   

}

output "vnet_addres_space" {
    value = azurerm_virtual_network.vnet.id
}
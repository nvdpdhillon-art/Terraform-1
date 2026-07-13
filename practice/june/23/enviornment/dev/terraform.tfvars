    vprefix = "dev"
    vrgs = {
        rg1 = {
            name = "vnet_rg1"
            location = "japanwest"
        }
           rg2 = {
            name = "vnet_rg2"
            location = "japanwest"
        }
    }
    vvnet = {
        vnet1 = {
            name                    = "vnetril"
            resource_group_name     = "dev-vnet_rg1"
            location                = "japanwest"
            address_space           = ["10.0.0.0/16"]
        }
    }
    vsubnet = {
        subnet1 = {
            name                    = "frontend"
            resource_group_name     = "dev-vnet_rg1"
            virtual_network_name    = "dev-vnetril"
            address_prefixes        = ["10.0.1.0/24"] 
        }
        subnet2 = {
            name                    = "AzureBastionSubnet"
            resource_group_name     = "dev-vnet_rg1"
            virtual_network_name    = "dev-vnetril"
            address_prefixes        = ["10.0.2.0/24"] 
        }
    }
    # Create Network Interface Card
vnic =  {
        nic1 = {
            name                = "nic1"
            location            = "japanwest"
            resource_group_name = "dev-vnet_rg1"

            ip_configuration = {
                name                          = "internal"
                subnet_id                     = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/virtualNetworks/dev-vnetril/subnets/frontend"
                private_ip_address_allocation = "Dynamic"
            }
    }
        nic2 = {
                name                = "nic2"
                location            = "japanwest"
                resource_group_name = "dev-vnet_rg1"

                ip_configuration = {
                    name                          = "internal"
                    subnet_id                     = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/virtualNetworks/dev-vnetril/subnets/frontend"
                    private_ip_address_allocation = "Dynamic"
            }
    }    
}

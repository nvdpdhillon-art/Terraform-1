    vprefix = "dev"
    vrgs = {
        rg1 = {
            name = "vnet_rg1"
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
        vsubnet1 = {
        name                    = "frontend"
        resource_group_name     = "dev-vnet_rg1"
        virtual_network_name    = "dev-vnetril"
        address_prefixes        = ["10.0.1.0/24"] 
        }
        vsubnet2 = {
        name                    = "azurebastionsubnet"
        resource_group_name     = "dev-vnet_rg1"
        virtual_network_name    = "dev-vnetril"
        address_prefixes        = ["10.0.2.0/24"] 
        }
    }
    vnsg = {
        nsg1 = {
         name                = "nsg1"
         location            = "japanwest"
         resource_group_name = "dev-vnet_rg1"

            security_rule = {
            rule1 = {
            name                       = "test123"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "3389"
            source_address_prefix      = "10.0.2.0/24"
            destination_address_prefix = "*"
        }
         rule2 = {
            name                       = "test123"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "22"
            source_address_prefix      = "10.0.2.0/24"
            destination_address_prefix = "*"
        }
        }
        }
    }
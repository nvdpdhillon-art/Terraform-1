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
            name                    = "AzureBastionSubnet"
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
                    name                       = "rule1"
                    priority                   = 101
                    direction                  = "Inbound"
                    access                     = "Allow"
                    protocol                   = "Tcp"
                    source_port_range          = "*"
                    destination_port_range     = "3389"
                    source_address_prefix      = "10.0.2.0/24"
                    destination_address_prefix = "*"
                }
                rule2 = {
                    name                       = "rule2"
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

    
vnsgass = {
  subnetnsg1 = {
    subnet_id                 = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/virtualNetworks/dev-vnetril/subnets/dev-frontend"
    network_security_group_id = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/networkSecurityGroups/dev-nsg1"
  }
}

vpublicip = {
    publicip1 = {
        name                = "publicip1"
        location            = "japanwest"
        resource_group_name = "dev-vnet_rg1"
        allocation_method   = "Static"
        sku                 = "Standard"
        }
}
vbastion = {
    bastion1 = {
        
                name                = "bastion1"
                location            = "japanwest"
                resource_group_name = "dev-vnet_rg1"

                ip_configuration     = {
                    name                 = "configuration1"
                    subnet_id            = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/virtualNetworks/dev-vnetril/subnets/AzureBastionSubnet"
                    public_ip_address_id = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/publicIPAddresses/dev-publicip1"
            }

        }
}
vnic =  {
        nic1 = {
            name                = "nic1"
            location            = "japanwest"
            resource_group_name = "dev-vnet_rg1"

            ip_configuration = {
                name                          = "internal"
                subnet_id                     = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/virtualNetworks/dev-vnetril/subnets/dev-frontend"
                private_ip_address_allocation = "Dynamic"
            }
    }
}

# WIndowsVM
vvmwin = {
    vmwin  =    {
        name                = "windowsvm1"
        resource_group_name = "dev-vnet_rg1"
        location            = "japanwest"
        size                = "Standard_D4_v5"
        admin_username      = "adminuser"
        admin_password      = "P@$$w0rd1234!"
        network_interface_ids = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/networkInterfaces/dev-nic1"

        os_disk ={
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
        }

        source_image_reference = {
            publisher = "MicrosoftWindowsServer"
            offer     = "WindowsServer"
            sku       = "2016-Datacenter"
            version   = "latest"
        }
        }
}

#VM Linux 
vvmlnx = {
    vmlnx1 = {
        name                = "linuxvm1"
        resource_group_name = "dev-vnet_rg1"
        location            = "japanwest"
        size                = "Standard_D4_v5"
        admin_username      = "adminuser"
        admin_password      = "P@$$w0rd1234!"
        network_interface_ids = "/subscriptions/65879a1d-8a71-47e6-af69-9f811ecad89e/resourceGroups/dev-vnet_rg1/providers/Microsoft.Network/networkInterfaces/dev-nic1"


  #      admin_ssh_key = {
   #         username   = "adminuser"
   #         public_key = file("~/.ssh/id_rsa.pub")
   #     }

        os_disk = {
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
        }

        source_image_reference = {
            publisher = "Canonical"
            offer     = "0001-com-ubuntu-server-jammy"
            sku       = "22_04-lts"
            version   = "latest"
        }
    }
}
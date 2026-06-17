vprefix = "dev"
vrgs = {
    rg1 = {
        name = "vnet_rg1"
        location = "japanwest"
        tags = {
            catch = "taken"
            ified_by = "tukaram"
            address = "galli Boy"
        }
    }
}

vvnet ={
  vnet1 ={
 name                = "vnet1"
  location            = "japanwest"
  resource_group_name = "vnet_rg1"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

#  subnet {
 #   name             = "subnet1"
  #  address_prefixes = ["10.0.1.0/24"]
  #}


  tags = {
    environment = "Dev"
  }
}
}
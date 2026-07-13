variable "vvnet" {
 type = map(object({
    name = string
    location= string
    resource_group_name= string
    address_space = list (string)
    dns_servers = list (string)
    tags                = map(string) 
 }))  
}
variable "vprefix" {}
module "mrgs" {
    source = "../rg-vnet-subnet/rg"
    vrgs = var.vrgs
    vprefix = var.vprefix
}
module "mvnet" {
    source = "../rg-vnet-subnet/vnet"
    vvnet = var.vvnet
    vprefix=var.vprefix
}

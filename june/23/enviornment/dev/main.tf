module "mrgs" {
  source  = "../../modules/rg"
  vrgs    = var.vrgs
  vprefix = var.vprefix

}
module "mvnet" {
  depends_on = [module.mrgs]
  source     = "../../modules/vnet"
  vvnet      = var.vvnet
  vprefix    = var.vprefix
}
module "msubnet" {
  depends_on = [module.mvnet]
  source     = "../../modules/subnet"
  vsubnet    = var.vsubnet
  vprefix    = var.vprefix
}
module "mnsg" {
  depends_on = [module.msubnet]
  source     = "../../modules/nsg"
  vprefix    = var.vprefix
  vnsg       = var.vnsg
}
module "mnsgass" {
  depends_on = [module.msubnet, module.mnsg]
  source = "../../modules/azure_subnet_network_security_group_association"
  vprefix = var.vprefix
  vnsgass = var.vnsgass
}

module "mnic"{
  depends_on = [module.msubnet, module.mnsg]
  source = "../../modules/nic"
  vnic = var.vnic
  vprefix = var.vprefix
}
module "mvmwin" {
    depends_on = [module.mnic]
  source= "../../modules/vmwin"
    vvmwin = var.vvmwin
  vprefix = var.vprefix
}
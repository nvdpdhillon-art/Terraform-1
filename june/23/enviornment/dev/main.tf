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
  rgid       = module.mrgs.rgid["rg2"].name
}
module "msubnet" {
  depends_on = [module.mvnet]
  source     = "../../modules/subnet"
  vsubnet    = var.vsubnet
  vprefix    = var.vprefix
}

# Create Network Association Group
module "mnic"{
  depends_on = [module.msubnet]
  source = "../../modules/nic"
  vnic = var.vnic
  vprefix = var.vprefix
  subnet = module.msubnet.subnetid["subnet1"].id
}
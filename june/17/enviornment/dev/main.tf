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
  source     = "../../modules/nsg"
  vprefix    = var.vprefix
  vnsg       = var.vnsg
}
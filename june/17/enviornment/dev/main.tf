# Create RG's
module "mrgs" {
  source  = "../../modules/rg"
  vrgs    = var.vrgs
  vprefix = var.vprefix

# create vnet
}
module "mvnet" {
  depends_on = [module.mrgs]
  source     = "../../modules/vnet"
  vvnet      = var.vvnet
  vprefix    = var.vprefix
}

# Create Subnets
module "msubnet" {
  depends_on = [module.mvnet]
  source     = "../../modules/subnet"
  vsubnet    = var.vsubnet
  vprefix    = var.vprefix
}

# create Network securtiy group
module "mnsg" {
  depends_on = [module.msubnet]
  source     = "../../modules/nsg"
  vprefix    = var.vprefix
  vnsg       = var.vnsg
}

# create Network securtiy group Assocications
module "mnsgass" {
  depends_on = [module.msubnet, module.mnsg]
  source = "../../modules/azure_subnet_network_security_group_association"
  vprefix = var.vprefix
  vnsgass = var.vnsgass
}

# Create Network Association Group
module "mnic"{
  depends_on = [module.msubnet]
  source = "../../modules/nic"
  vnic = var.vnic
  vprefix = var.vprefix
}

# Create Windows VM
module "mvmwin" {
    depends_on = [module.mnic]
  source= "../../modules/vmwin"
    vvmwin = var.vvmwin
  vprefix = var.vprefix
}

# Create Linux VM
module "mvmlnx" {
  depends_on = [module.mnic]
  source = "../../modules/vmlnx"
  vvmlnx = var.vvmlnx
  vprefix = var.vprefix
}

# Create Public IP
module "mpublicip" {
  source      = "../../modules/publicip"
  vpublicip   = var.vpublicip
  vprefix     = var.vprefix
}

# Create Bastion
module "mbastion" {
  depends_on  = [module.mpublicip]
  source      = "../../modules/bastion"
  vbastion    = var.vbastion
  vprefix     = var.vprefix
}

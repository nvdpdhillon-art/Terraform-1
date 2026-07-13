# environment/dev/output.tf

output "rgid" {
  value = module.mrgs.rgid
}
output "subnetid" {
  value = module.msubnet.subnetid
}
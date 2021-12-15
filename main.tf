module "random" {
  source = "./modules/random"
}

module "regions" {
  source = "./modules/regions"

  static = module.random.static
  varies = module.random.varies

  # depends_on = [module.random.varies]
}

output "random" {
  value = module.random
}

output "regions" {
  value = module.regions
}

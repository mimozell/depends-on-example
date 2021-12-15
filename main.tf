module "random" {
  source = "./modules/random"
}

module "regions" {
  source = "./modules/regions"

  static = module.random.static

  # depends_on = [module.random]
}

output "random" {
  value = module.random
}

output "regions" {
  value = module.regions
}

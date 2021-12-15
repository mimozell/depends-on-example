terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.66.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-2"
}

module "random" {
  source = "./modules/random"
}

module "regions" {
  source = "./modules/regions"

  static = module.random.static

  # depends_on = [
  #   module.random
  # ]
}

output "random" {
  value = module.random
}

output "regions" {
  value = module.regions
}

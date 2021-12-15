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
  profile = "region-read"
}

module "a" {
  source = "./module-a"
}

module "b" {
  source = "./module-b"
#  depends_on = [module.a]
}

output "module_a_output" {
  value = module.a.random_string
}

output "module_b_output" {
  value = module.b.data_output
}
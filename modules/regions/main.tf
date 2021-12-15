data "aws_regions" "regions" {
  all_regions = true
}

variable "static" {}

variable "varies" {}

output "regions" {
  value = { for name in data.aws_regions.regions.names:
    name => name
  }
}

output "static" {
  value = var.static
}

output "varies" {
  value = var.varies
}

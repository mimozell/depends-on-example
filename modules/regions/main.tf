data "aws_regions" "regions" {
  all_regions = true
}

variable "static" {}

output "regions" {
  value = data.aws_regions.regions.names
}

output "static" {
  value = var.static
}

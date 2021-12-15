data "aws_regions" "current" {
  all_regions = true
}

output "data_output" {
  value = data.aws_regions.current.names
}
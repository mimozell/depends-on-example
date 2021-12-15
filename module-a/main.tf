resource "random_string" "random" {
  length           = 16
  keepers = {
    first = timestamp()
  }
}

output "random_string" {
  value = random_string.random.result
}
resource "random_string" "random" {
  length = 16

  keepers = {
    first = timestamp()
  }
}

output "random" {
  value = random_string.random.result
}

output "static" {
  value = "never changes"
}

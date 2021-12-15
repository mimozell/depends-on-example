resource "random_string" "random" {
  length = 16

  keepers = {
    first = timestamp()
  }
}

resource "time_sleep" "sleep10s" {
  create_duration = "10s"

  depends_on = [
    random_string.random,
  ]
}

output "random" {
  value = random_string.random.result
}

output "static" {
  value = "never changes"
}

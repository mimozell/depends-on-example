resource "random_string" "random" {
  length  = 40
  special = false

  keepers = {
    first = timestamp()
  }
}

resource "time_sleep" "sleep15s" {
  create_duration = "15s"

  depends_on = [
    random_string.random,
  ]
}

output "random" {
  value = random_string.random.result
}

output "varies" {
  value = "this changes (${timestamp()})"
}

output "static" {
  value = "never changes"
}

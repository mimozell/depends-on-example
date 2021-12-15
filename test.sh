#!/usr/bin/env bash
set -euo pipefail

echo "==> Without depends on"
terraform init
terraform plan -out plan
terraform apply plan

echo "==> With depends on"
sed -I '' -E 's/  # depends_on (.*)/  depends_on \1/g' main.tf
terraform init
terraform plan -out plan
terraform apply plan

echo "==> Reset back"
sed -I '' -E 's/  depends_on (.*)/  # depends_on \1/g' main.tf

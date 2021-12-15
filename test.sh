#!/usr/bin/env bash
set -euo pipefail

# rm -fv terraform.tfstate terraform.tfstate.backup

echo
echo "==> WITHOUT DEPENDS ON"
echo
terraform init
terraform plan -out plan
terraform apply plan

echo
echo "==> WITH DEPENDS ON"
echo
sed -I '' -E 's/  # depends_on (.*)/  depends_on \1/g' main.tf
terraform init
terraform plan -out plan

echo
echo "==> RESET BACK"
echo
sed -I '' -E 's/  depends_on (.*)/  # depends_on \1/g' main.tf

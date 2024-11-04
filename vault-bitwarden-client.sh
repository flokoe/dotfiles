#!/usr/bin/env bash

set -Eeuo pipefail

option="${1:-}"

if [[ $option != "--vault-id" ]]; then
  echo "Invalid option: $option"
  exit 1
fi

vault_id="${2:-}"

if [[ -z $vault_id ]]; then
  echo "Missing Vault ID"
  exit 2
fi

bw get item "$vault_id" | jq -r .login.password

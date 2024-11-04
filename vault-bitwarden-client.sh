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

if ! which bw &> /dev/null; then
  echo "Bitwarden CLI is not installed"
  exit 3
fi

if ! which jq &> /dev/null; then
  echo "jq is not installed"
  exit 4
fi

bw_status="$(bw status | jq -r .status)"

if [[ $bw_status != "unlocked" ]]; then
  echo "Bitwarden is not unlocked"
  exit 5
fi

bw get item "$vault_id" | jq -r .login.password

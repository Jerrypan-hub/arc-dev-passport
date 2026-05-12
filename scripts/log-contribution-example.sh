#!/usr/bin/env bash
set -euo pipefail

if [ ! -f .env ]; then
  echo "Missing .env. Copy .env.example to .env and fill PRIVATE_KEY and CONTRACT_ADDRESS first."
  exit 1
fi

set -a
. ./.env
set +a

cast send "$CONTRACT_ADDRESS" \
  "logContribution(string,string)" \
  "demo" \
  "https://github.com/yourname/arc-dev-passport#demo" \
  --rpc-url "$ARC_TESTNET_RPC_URL" \
  --private-key "$PRIVATE_KEY"

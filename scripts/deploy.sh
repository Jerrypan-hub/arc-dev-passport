#!/usr/bin/env bash
set -euo pipefail

if [ ! -f .env ]; then
  echo "Missing .env. Copy .env.example to .env and fill PRIVATE_KEY first."
  exit 1
fi

set -a
. ./.env
set +a

forge build
forge create src/ArcDevPassport.sol:ArcDevPassport \
  --rpc-url "$ARC_TESTNET_RPC_URL" \
  --private-key "$PRIVATE_KEY" \
  --broadcast

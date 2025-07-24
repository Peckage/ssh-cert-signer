#!/usr/bin/env bash

set -e

CA_KEY="$HOME/.ssh/ca/id_ca"

if [[ ! -f "$CA_KEY" ]]; then
  echo "❌ CA key not found at $CA_KEY"
  exit 1
fi

read -p "📄 Enter path to public key to sign: " PUBKEY_PATH

if [[ ! -f "$PUBKEY_PATH" ]]; then
  echo "❌ Public key not found at: $PUBKEY_PATH"
  exit 1
fi

read -p "👤 Enter username (principal) for this cert: " PRINCIPAL
read -p "🪪 Enter certificate ID (e.g. 'emergency-access'): " CERT_ID
read -p "⏰ Enter validity window (e.g. +20m, +1h, +2d): " VALIDITY

CERT_OUTPUT="${PUBKEY_PATH%.pub}-cert.pub"

echo ""
echo "🚀 Signing..."
ssh-keygen -s "$CA_KEY" \
  -I "$CERT_ID" \
  -n "$PRINCIPAL" \
  -V "+0s:$VALIDITY" \
  "$PUBKEY_PATH"

if [[ -f "$CERT_OUTPUT" ]]; then
  echo "✅ Certificate created at: $CERT_OUTPUT"
  ssh-keygen -L -f "$CERT_OUTPUT"
else
  echo "❌ Certificate not created."
  exit 1
fi

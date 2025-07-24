#!/usr/bin/env bash

mkdir -p "$HOME/.ssh-cert-signer"
cp config.example "$HOME/.ssh-cert-signer/config"

echo "✅ Config installed at ~/.ssh-cert-signer/config"

mkdir -p "$HOME/.local/bin"
cp bin/sign "$HOME/.local/bin/ssh-cert-sign"
chmod +x "$HOME/.local/bin/ssh-cert-sign"

echo "✅ CLI installed as 'ssh-cert-sign'"
echo "➡️  Make sure ~/.local/bin is in your \$PATH"

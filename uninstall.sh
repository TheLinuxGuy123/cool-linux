#!/bin/bash
# Simple reset script for cool-linux
[[ -n "$ZSH_VERSION" ]] && CONF="$HOME/.zshrc" || CONF="$HOME/.bashrc"
sed -i '/# --- LC-START ---/,/# --- LC-END ---/d' "$CONF"
echo "Terminal restored to default. Please restart your terminal."

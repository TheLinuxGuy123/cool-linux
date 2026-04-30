#!/bin/bash

# --- Color Definitions ---
G='\e[1;32m'
B='\e[1;34m'
C='\e[1;36m'
W='\e[0m'

clear
echo -e "${C}------------------------------------------${W}"
echo -e "${G}          COOL-LINUX VERSION 1.2          ${W}"
echo -e "${C}------------------------------------------${W}"

# Identify config file
[[ -n "$ZSH_VERSION" ]] && CONF="$HOME/.zshrc" || CONF="$HOME/.bashrc"

# Input prompts
echo -e "${B}»${W} Custom Symbol (e.g. ❯, ⚡, 🚀): "
read -r SYMBOL

echo -e "${B}»${W} Welcome Message: "
read -r WELCOME

echo -e "${B}»${W} Path to startup script (optional): "
read -r S_PATH

# Wipe previous LC settings to prevent clutter
sed -i '/# --- LC-START ---/,/# --- LC-END ---/d' "$CONF" 2>/dev/null

# Inject new configuration
cat <<EOF >> "$CONF"
# --- LC-START ---
# Welcome
echo -e "${G}$WELCOME${W}"

# Theme Logic
if [ -n "\$ZSH_VERSION" ]; then
    # ZSH Style: path then symbol
    export PROMPT="%F{blue}%~ %F{green}$SYMBOL %f$ "
else
    # BASH Style: path then symbol
    export PS1="\[\e[1;34m\]\w \[\e[1;32m\]$SYMBOL \[\e[0m\]$ "
fi

# Startup Tasks
[[ -f "$S_PATH" ]] && bash "$S_PATH"
# --- LC-END ---
EOF

echo -e "${C}------------------------------------------${W}"
echo -e "${G}Successfully applied to $CONF${W}"
echo -e "Restart terminal or run: ${C}source $CONF${W}"

#!/usr/bin/env bash

cat >> /home/node/.zshrc <<'EOF'
alias g="git"
alias a="git add -p"
alias s="git status"
alias d="git diff"
EOF

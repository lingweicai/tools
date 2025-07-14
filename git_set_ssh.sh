#!/bin/bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# add ssh-key on git ssh access:
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
paste to : https://github.com/settings/keys

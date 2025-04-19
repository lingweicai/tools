#!/bin/bash
git remote add upstream https://github.com/cockpit-project/starter-kit.git
git fetch upstream
git checkout main
git remote -v
git rebase upstream/main

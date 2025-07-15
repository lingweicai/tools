#!/bin/bash
# setup user name and email
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
# git rebase
git remote add upstream https://github.com/cockpit-project/starter-kit.git
git fetch upstream
git checkout main
git remote -v
git rebase upstream/main

#!/bin/bash
git fetch upstream
git checkout main
git rebase upstream/main

#!/bin/bash

git pull --rebase prezto master
git submodule foreach git pull origin master
git submodule update --init --recursive

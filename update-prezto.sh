#!/bin/bash

git pull prezto master
git submodule foreach git pull origin master
git submodule update --init --recursive

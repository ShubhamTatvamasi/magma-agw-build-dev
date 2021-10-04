#!/bin/bash

set -ex

# Install prerequisites
pip3 install ansible fabric3 jsonpickle requests PyYAML

brew install vagrant virtualbox
vagrant plugin install vagrant-vbguest

# Cloning magma repo:
git clone https://github.com/magma/magma.git --depth 1

# start building magma
cd magma/lte/gateway
fab dev package:vcs=git

# copy magma packages to github runner
vagrant ssh -c "cp -r magma-packages /vagrant"

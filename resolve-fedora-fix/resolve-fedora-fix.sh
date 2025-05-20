#!/bin/bash

#Credit to https://github.com/H3rz3n/Davinci-Resolve-Fedora-38-39-40-Fix
cd /opt/resolve/libs
sudo mkdir disabled-libraries
sudo mv libglib* disabled-libraries
sudo mv libgio* disabled-libraries
sudo mv libgmodule* disabled-libraries

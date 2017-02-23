#!/bin/bash
yum install -y man sudo
cd ~/builder
./build_one.sh https://github.com/m-lab/npad-support master iupui_npad

# When this exits, the rpm should be available under slicebase-i386/i686


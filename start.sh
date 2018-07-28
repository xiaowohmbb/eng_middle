#!/bin/bash

source /etc/profile
bin=`dirname "$0"`
app_home=`cd "$bin"/; pwd`
cd ${app_home}
source virtural_env/bin/activate
python3 eng_middle.py

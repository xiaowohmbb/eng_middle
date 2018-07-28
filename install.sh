#!/bin/bash

source /etc/profile
bin=`dirname "$0"`
app_home=`cd "$bin"/; pwd`
cd ${app_home}
rm -rf virtural_env
virtualenv -p python3 virtural_env
source virtural_env/bin/activate
pip3 install pymysql
pip3 install configparser
pip3 install retrying
#deactivate
#!/bin/bash

./init_settings.sh
./install_yum_tools.sh
./install_rbenv.sh
. /root/.bashrc
./install_chef-solo.sh
. /root/.bashrc
updatedb

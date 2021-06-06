#!/bin/bash

#export CS_SCRIPTS_DIR="/cloudstarter/scripts"
#export CS_RAM_DRIVE_DIR="/dev/ram"

mkdir $CS_RAM_DRIVE_DIR
mkdir $CS_RAM_DRIVE_DIR/cloud_cli_dir
mkdir -p `dirname $CS_CLOUD_CLI_DIR`
ln -s $CS_RAM_DRIVE_DIR/cloud_cli_dir $CS_CLOUD_CLI_DIR

#export PATH="${CKS_BIN}/:$PATH"

source $CS_SCRIPTS_DIR/cloudstarter-common-functions.sh
source $CS_SCRIPTS_DIR/cloudstarter-functions.sh

echo "CloudStarter (version 1.0)"

if [[ ! -f /workspace/.cloudstarter/cloud_cli_data.zip ]]
then
    CS_Login
else 
    CS_Restore
fi

bash

[[ ! -f /workspace/.cloudstarter/cloud_cli_data.zip ]] && CS_Logout






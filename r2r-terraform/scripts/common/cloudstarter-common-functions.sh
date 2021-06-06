#!/bin/bash


function CS_Login() {
    echo "Login..."
    CS_DoLogin
}

function CS_Logout() {
    echo "Logout..."
    [[ -f /workspace/.cloudstarter/cloud_cli_data.zip ]] && rm -f /workspace/.cloudstarter/cloud_cli_data.zip
    CS_DoLogout
}
function logout() {
    CS_Logout
}

function CS_Remember() {
    mkdir -p /workspace/.cloudstarter
    echo "Please input a password so we can store your credentials securely"
    CURRENT_DIR=$(pwd)
    cd `dirname $CS_CLOUD_CLI_DIR`
    zip -qer /workspace/.cloudstarter/cloud_cli_data.zip `basename $CS_CLOUD_CLI_DIR`/ -x '*.log'
    cd $CURRENT_DIR
}

function remember() {
    CS_Remember
}

function CS_Restore() {
    echo "Please input a password to restore"
    read -s password

    mkdir -p $CS_CLOUD_CLI_DIR/ 
    unzip -P $password -oq /workspace/.cloudstarter/cloud_cli_data.zip -d `dirname $CS_CLOUD_CLI_DIR`
}
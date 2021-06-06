#!/bin/bash


function CS_DoLogin() {
    gcloud auth login
}

function CS_DoLogout() {
    echo "yes" | gcloud auth revoke  
}

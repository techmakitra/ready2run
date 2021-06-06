#!/bin/bash

echo "Clearing workspace"

rm -Rf /cloudkickstarter/conf/.terraform
rm -f /cloudkickstarter/conf/terraform.tfstate
rm -f /cloudkickstarter/conf/.terraform.lock.hcl
rm -f /cloudkickstarter/conf/terraform.tfstate.backup

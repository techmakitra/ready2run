#!/bin/bash

#echo "CloudKickstarter: $@"

#terraform $@

terraform init

/cloudkickstarter/bin/cloudkickstarter-shell.sh 

/cloudkickstarter/bin/clearTerraformState.sh

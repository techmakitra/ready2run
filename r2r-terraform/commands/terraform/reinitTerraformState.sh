#!/bin/bash

echo "Clearing workspace"

/cloudkickstarter/bin/clearTerraformState.sh

terraform init

#!/usr/bin/env bash

# Set the subscription
export ARM_SUBSCRIPTION_ID="4d2f3d90-3f7a-4f44-bb7f-bee999a3638b"
# set the application / environment
export TF_VAR_application_name="linuxvm"
export TF_VAR_environment_name="dev"
export TF_VAR_base_address_space="10.40.0.0/22"
# set the backend
terraform init \
    -backend-config="env/dev-backend.tfvars"
# run terraform
terraform "$*"

rm -rf .terraform

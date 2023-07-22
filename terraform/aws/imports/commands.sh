#!/bin/bash

terraform state list

terraform plan -generate-config-out="generated.tf"

terraform apply
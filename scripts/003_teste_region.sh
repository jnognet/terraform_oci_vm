#!/bin/env bash
set -o xtrace

oci iam region list --config-file ~/.oci/config --profile DEFAULT --auth security_token | grep saopaulo

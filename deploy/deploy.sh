#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$HOSTAPI" == "" ]]; then
  echo "Must have defined HOSTAPI with the value of the target API server"
  exit 1
fi

pushd $_dir/deploy
ansible-playbook -e mig_ui_cluster_api_endpoint="$HOSTAPI" -e state=present playbook.yaml
popd

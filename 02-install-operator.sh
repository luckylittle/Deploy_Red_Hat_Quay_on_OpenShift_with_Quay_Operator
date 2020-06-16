#!/bin/bash

API=$(cat auth/kubeconfig | grep server | cut -d : -f 2,3 | tr -d ' ')
KUBEPASS=$(cat auth/kubeadmin-password)

# Login to the new AWS cluster
oc login ${API} -u kubeadmin -p ${KUBEPASS} --insecure-skip-tls-verify=true

# Create a new project quay-enterprise
oc new-project quay-enterprise

# Create a new 'OperatorGroup' in quay-enterprise project
oc apply -f resources/operatorgroup.yaml

# Create a new 'Subscription' for quay-operator
oc apply -f resources/sub.yaml

echo 'Finished!'

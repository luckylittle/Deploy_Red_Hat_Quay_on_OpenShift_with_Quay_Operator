#!/bin/bash

# Create a new project quay-enterprise
oc new-project quay-enterprise

# Create a new 'OperatorGroup' in quay-enterprise project
oc apply -f resources/operatorgroup.yaml

# Create a new 'Subscription' for quay-operator
oc apply -f resources/sub.yaml

echo 'Finished!'

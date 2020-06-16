#!/bin/bash

# Switch to 'quay-enterprise' project
oc project quay-enterprise

# Create secret to be able to pull Quay images
oc apply -f resources/quay-auth.yaml

# Create a simple 'QuayEcosystem'
oc create -f resources/quayecosystem_cr.yaml

sleep 10s

# Get route
oc get route quay-enterprise-ecosystem

# Log in to the URL from the previous step (e.g. example-quayecosystem-quay-example.com)

echo 'Finished!'

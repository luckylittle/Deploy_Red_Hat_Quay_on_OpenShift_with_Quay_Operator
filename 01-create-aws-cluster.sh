#!/bin/bash

# Copy the 'install-config' for AWS to the root folder of this repository
cp resources/install-config-aws.yaml install-config.yaml

echo 'This step will take up to 40 minutes...'

# Run 'openshift-install' with the 'install-config'. This process will automatically remove the 'install-config.yaml' in the root folder of this repository!
openshift-install create cluster

echo 'Finished!'

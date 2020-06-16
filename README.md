# Red Hat Quay 3.3 - Deploy Red Hat Quay on AWS OpenShift 4 with Quay Operator

## Prerequisites for OpenShift custer on AWS

* AWS account (aws_access_key_id and aws_secret_access_key in the default profile)
* openshift-install tool 4.4.6 - download from [here](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.4.6/)
* Put your pull-secret to `resources/install-config.yaml` under `pullSecret` key (line # 54)

## Prerequisites for OpenShift custer on VMware vSphere

* Put your VMware vCenter service account in `resources/install-config-vsphere.yml` (`username` line # 22 and `password` line # 23)
* Put your pull-secret to `resources/install-config.yaml` under `pullSecret` key (line # 28)

## Prerequisites for Red Hat Quay

Here are a few things you need to know before you begin the Red Hat Quay on OpenShift deployment:

* OpenShift cluster: You need a privileged account to an OpenShift 4.2 or later cluster on which to deploy the Red Hat Quay. That account must have the ability to create namespaces at the cluster scope.
* Storage: AWS cloud storage is used as an example in the following procedure. As an alternative, you can create Ceph cloud storage using steps from the Set up Ceph section of the high availability Red Hat Quay deployment guide. The following is a list of other supported cloud storage: Amazon S3, Azure Blob Storage, Google Cloud Storage, Ceph Object Gateway (RADOS), OpenStack Swift, CloudFront + S3, OpenShift Container Storage.
* You need engough capacity to run PostgreSQL database, Redis, Red Hat Quay and Clair.

## Deploy Red Hat Quay ecosystem

```bash
# Create OpenShift 4.4.6 cluster on AWS
./01-create-aws-cluster.sh

# After logging in to the above OpenShift cluster (`oc login`), run bash scripts sequentially:
./02-install-operator.sh

# Read https://access.redhat.com/solutions/3533201
#   $ podman login -u="redhat+quay" -p="<REDACTED>" quay.io
#   $ cat /run/user/${UID}/containers/auth.json
# Put the secret on line # 8 in 'resources/quay-auth.yaml'
./03-deploy-quay.sh
```

Eventually, you might want to destroy the entire cluster:

```bash
./04-destroy-aws-cluster.sh
```

## Contributors

Lucian Maly <<lucian@redhat.com>>

---

_Last update: Mon Jun 15 23:32:29 UTC 2020_

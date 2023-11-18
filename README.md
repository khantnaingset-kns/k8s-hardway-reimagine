# Kubernetes the Hard way with Terraform

# Scope

- Setup Kubernetes cluster from scratch using Kubeadm
    - Number of Nodes
        - 1 Master
        - 3 workers

# Steps

1. Prerequisites
    - Google Cloud Platform
        - This tutorial uses GCP to set up a K8s cluster from scratch.
    - Terraform
        - This tutorial uses Terraform to leverage the base infrastructure setup.
    - Client tools
        - cfssl
        - cfssljson
        - kubectl
# Chainlink-EKS
IaC resources to run Chainlink nodes and dependencies in an EKS cluster. 

## EKS Config Steps
1. aws eks update-kubeconfig --name <cluster-name> --region <region>
2. Replace client.authentication.k8s.io/v1alpha1 with client.authentication.k8s.io/v1beta1 in ~/.kube/config

## Helm Charts
Helm charts were sourced from the `develop` branch of https://github.com/vulcanlink/charts with modifications where needed to run on AWS Fargate.
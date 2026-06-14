# AWS EKS Landing Zone


## Overview

This repository contains a reproducible AWS EKS foundation platform built with Terraform.

The goal of the project is to provide a clean and repeatable starting point for Kubernetes workloads running on AWS while keeping the architecture simple, understandable and cost-conscious.

Rather than focusing immediately on advanced platform capabilities, this project establishes the core building blocks required by most Kubernetes environments:

- AWS networking
- Amazon EKS
- IAM integration
- Kubernetes operations
- Helm package management
- Metrics collection foundations
- Public service exposure
- Infrastructure lifecycle management

The platform is intentionally designed as an ephemeral environment:

- create infrastructure on demand
- validate deployments and platform operations
- perform troubleshooting and experimentation
- destroy everything when finished

This approach reinforces Infrastructure as Code, FinOps awareness, reproducibility and operational discipline.

The repository also serves as a foundation for future enhancements such as:

- AWS Load Balancer Controller
- Ingress management
- Prometheus
- Grafana
- CI/CD pipelines
- Application delivery workflows

## Current Capabilities

Successfully validated in a real AWS environment:

- Modular Terraform architecture
- Reusable Terraform modules
- AWS VPC provisioning
- Multi-AZ networking
- Internet Gateway and routing configuration
- Amazon EKS cluster deployment
- Managed node group provisioning
- IAM role creation and integration
- Amazon ECR repository provisioning
- Kubernetes access through kubectl
- Helm installation and usage
- metrics-server deployment
- Cluster metrics collection
- kubectl top validation
- Demo NGINX workload deployment
- Internal Kubernetes networking validation
- Public exposure through AWS LoadBalancer
- Full terraform apply / terraform destroy lifecycle validation

## Real-World Validation

This project has already been recreated from scratch multiple times.

Validated workflow includes:

- terraform apply
- EKS cluster creation
- kubeconfig generation
- worker node registration
- Kubernetes workload deployment
- metrics collection
- public service exposure
- clean infrastructure destruction

A real deployment issue related to initial node sizing constraints was diagnosed and corrected during implementation, adding practical troubleshooting value.

## Architecture

Current platform includes:

- 1 AWS VPC
- 2 public subnets across 2 Availability Zones
- Internet Gateway
- Route tables and associations
- Amazon EKS control plane
- Managed worker node group
- IAM roles for cluster and nodes
- Amazon ECR repository
- Helm-based add-on deployment
- metrics-server
- Demo Kubernetes namespace
- Demo NGINX deployment
- Public AWS LoadBalancer service

## Repository Structure

```text
terraform/
├── environments/
│   └── dev/
└── modules/
    ├── network/
    ├── eks/
    └── ecr/

k8s/
helm/
docs/
scripts/
.github/
Makefile
README.md
```

## Tech Stack

- AWS
- Terraform
- Amazon EKS
- Kubernetes
- Amazon ECR
- Helm
- Metrics Server
- Prometheus (planned)
- Grafana (planned)
- GitHub Actions (planned)

## Skills Demonstrated

- Terraform module design
- Infrastructure as Code
- AWS networking fundamentals
- Amazon EKS provisioning
- IAM and role management
- Kubernetes workloads and services
- Helm package deployment
- Cluster metrics collection
- Kubernetes troubleshooting
- Public service exposure on AWS
- Infrastructure lifecycle management
- Cost-aware engineering practices
- Platform foundation design

## Cost Strategy

This project is intentionally built as an ephemeral lab environment:

- deploy when needed
- validate changes
- destroy after usage


## Recreate The Environment From Scratch

Prerequisites:

- AWS account
- Terraform
- AWS CLI
- kubectl
- Helm
- Valid AWS profile configured locally

Authenticate:

```bash
export AWS_PROFILE=tf-eks-observability
export AWS_REGION=eu-west-3
```

Initialize Terraform:

```bash
make init
```

Review changes:

```bash
make plan
```

Deploy infrastructure:

```bash
make apply
```

Configure kubectl:

```bash
make kubeconfig
```

Validate cluster:

```bash
make nodes
make pods
```

Check metrics:

```bash
make top
```

Destroy infrastructure:

```bash
make destroy
```

## Makefile Usage

The Makefile centralizes common platform operations and automatically uses the configured AWS profile.

Available commands:

```bash
make help
make init
make fmt
make validate
make plan
make apply
make destroy
make output
make kubeconfig
make nodes
make pods
make top
make clean-app
```

This removes the need to remember long Terraform and AWS CLI commands during daily platform operations.

## Next Steps

- AWS Load Balancer Controller
- Ingress resources
- Custom application image stored in ECR
- Prometheus deployment
- Grafana dashboards
- GitHub Actions CI/CD
- Automated application delivery
- Additional platform observability capabilities

## Author

Badis Merakchi
Cloud / DevOps Engineer
Geneva area, Switzerland / France

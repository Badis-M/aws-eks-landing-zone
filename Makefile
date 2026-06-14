AWS_PROFILE ?= tf-eks-observability
AWS_REGION ?= eu-west-3
TF_DIR := terraform/environments/dev

.PHONY: help init fmt validate plan apply destroy output kubeconfig nodes pods top clean-app

help:
	@echo "Available targets:"
	@echo "  make init        - Initialize Terraform"
	@echo "  make fmt         - Format Terraform files"
	@echo "  make validate    - Validate Terraform configuration"
	@echo "  make plan        - Show Terraform execution plan"
	@echo "  make apply       - Apply Terraform infrastructure"
	@echo "  make destroy     - Destroy Terraform infrastructure"
	@echo "  make output      - Show Terraform outputs"
	@echo "  make kubeconfig  - Configure kubectl for the EKS cluster"
	@echo "  make nodes       - Show Kubernetes nodes"
	@echo "  make pods        - Show all Kubernetes pods"
	@echo "  make top         - Show Kubernetes resource usage"
	@echo "  make clean-app   - Delete the demo namespace"

tf-init:
	cd $(TF_DIR) && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) terraform init

tf-fmt:
	cd $(TF_DIR) && terraform fmt -recursive

tf-validate:
	cd $(TF_DIR) && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) terraform validate

tf-plan:
	cd $(TF_DIR) && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) terraform plan

tf-apply:
	cd $(TF_DIR) && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) terraform apply

tf-destroy:
	cd $(TF_DIR) && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) terraform destroy

tf-output:
	cd $(TF_DIR) && AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) terraform output

kubeconfig:
	AWS_PROFILE=$(AWS_PROFILE) AWS_REGION=$(AWS_REGION) aws eks update-kubeconfig \
		--region $(AWS_REGION) \
		--name aws-eks-observability-platform-dev-eks \
		--profile $(AWS_PROFILE)

nodes:
	kubectl get nodes

pods:
	kubectl get pods -A

top:
	kubectl top nodes && kubectl top pods -A

clean-app:
	kubectl delete namespace demo --ignore-not-found=true
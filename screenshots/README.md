# Versioned IaC Foundation Deployment

## Objective

Deploy a repeatable Azure foundation using Bicep and Terraform, with infrastructure code versioned in Git.

## Architecture

- **Bicep:** Deploys a parameterized virtual network with application and data subnets.
- **Terraform:** Deploys a resource group and private Azure Storage Account using the AzureRM provider.
- **State:** Demonstrates Terraform state inspection and, if approved, Azure Blob Storage remote state.

## Prerequisites

- Azure subscription and appropriate resource permissions
- Azure CLI
- Bicep support through Azure CLI
- Terraform CLI
- Git and VS Code

## Deployment

### Bicep

1. Log in using `az login`.
2. Verify the subscription using `az account show`.
3. Create the Bicep resource group.
4. Validate and deploy `bicep/main.bicep`.
5. Capture the deployment outputs.

### Terraform

1. Navigate to `terraform/`.
2. Configure local `terraform.tfvars` with the subscription ID and a unique storage account name.
3. Run `terraform init`, `terraform fmt`, and `terraform validate`.
4. Run `terraform plan` and review the changes.
5. Run `terraform apply`.
6. Inspect resources using `terraform state list` and `terraform output`.
7. Configure remote state only if approved and migrate it carefully.

## State Management Notes

Terraform state tracks the resources managed by Terraform. Local state is stored on the workstation by default. Remote state in Azure Blob Storage can support collaboration and state locking.

State files may contain sensitive values. Do not commit state files, credentials, or local variable files to Git.

## Bicep and Terraform Comparison

- Bicep is designed specifically for Azure Resource Manager deployments.
- Terraform uses a provider-based model and supports infrastructure across multiple cloud platforms.
- Both support reusable, parameterized infrastructure definitions.
- Record differences observed during validation, deployment, output retrieval, and state management.

## Cleanup

Review the resources and confirm that no shared resources will be affected before deleting anything.

Delete the dedicated Bicep resource group:

`az group delete --name rg-iac-bicep-dev --yes --no-wait`

Destroy Terraform-managed resources from the Terraform directory:

`terraform destroy`

Do not destroy shared Module 3 resources or a shared remote-state storage account. If remote state is configured, preserve the backend until the Terraform-managed resources have been safely destroyed and the state is no longer needed.

## Evidence

Add deployment screenshots, Bicep output, Terraform plan/apply results, state inspection output, and Azure Portal verification.

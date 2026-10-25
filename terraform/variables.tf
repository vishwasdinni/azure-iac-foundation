
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  type    = string
  default = "rg-iac-tf-dev"
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "storage_account_name" {
  description = "Globally unique, lowercase name with 3-24 characters"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "Development"
    Module      = "4"
    ManagedBy   = "Terraform"
  }
}

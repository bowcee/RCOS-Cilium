terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.67.0"
    }
    helm = {
        source = "hashicorp/helm"
        version = "~> 2.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
    client_id = var.CLIENT_ID
    client_secret = var.CLIENT_SECRET
    subscription_id = var.SUBSCRIPTION_ID
    tenant_id = var.TENANT_ID
    features {}
}

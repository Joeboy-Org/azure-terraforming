terraform {
  required_version = "~> 1.11.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.22.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}
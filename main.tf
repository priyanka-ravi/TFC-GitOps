terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

variable "token" {
   type = string
   description = "GitHub token"
}

# Configure the GitHub Provider
provider "github" {
  token = var.token
}

# Add a user to the organization
resource "github_repository" "config_repo" {
  name        = "config_repo"
  description = "My config repository for GitOps"
  visibility  = "public"
}
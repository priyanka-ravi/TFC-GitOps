terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Create the required GitHub token
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

# Add a GitHub actions secret
# resource "github_actions_secret" "example_secret" {
#   repository       = github_repository.config_repo.name
#   secret_name       = "example_secret_name"
#   plaintext_value   = "example"
# }
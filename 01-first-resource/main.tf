# ==============================================================
# LAB 01 - Your First Resource
#
# WHAT THIS LAB CONTAINS:
#   - What a Terraform configuration file looks like
#   - The three required blocks to get started
#   - How to create your first resource (a local file)
#   - What happens when you run terraform apply
#
# PROVIDER USED: hashicorp/local
#   This provider creates files on your computer.
#   No AWS, no cloud, no account needed.
# ==============================================================

# BLOCK 1: terraform {}
terraform {

  # This config requires Terraform version 1.5 or higher.
  # If your version is older, Terraform will refuse to run.
  required_version = ">= 1.5"

  # required_providers tells Terraform which plugins to download.
  # Providers are what Terraform uses to talk to different systems
  # (AWS, GCP, Azure, local file system, etc.)
  required_providers {

    # We are using the "local" provider from HashiCorp.
    # It can create files and directories on your machine.
    local = {
      source  = "hashicorp/local"  # where to download it from
      version = "~> 2.4"           # use any 2.x version >= 2.4
    }
  }
}


# --------------------------------------------------------------
# BLOCK 2: provider {}
provider "local" {}

# --------------------------------------------------------------
# BLOCK 3: resource {}
resource "local_file" "hello" {

  # filename: where on disk to create the file
  # path.module is a built-in variable that means "this directory"
  filename = "${path.module}/hello.txt"

  # content: what to write inside the file
  content = "Hello from Terraform! This file was created by HCL."
}



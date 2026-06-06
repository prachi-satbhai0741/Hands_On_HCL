# ==============================================================
# LAB 02 - Strings
#
# WHAT THIS LAB CONTAINS:
#   - The string data type
#   - String interpolation: embedding values inside strings
#   - Heredoc: writing multi-line strings cleanly
#   - A few useful string functions
# ==============================================================

terraform {
  required_version = ">= 1.5"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}


# PLAIN STRINGS
resource "local_file" "plain" {
  filename = "${path.module}/01-plain-string.txt"
  content = "I am a plain string. Nothing special happening here."
}

# STRING INTERPOLATION
locals {
  app_name    = "my-app"
  environment = "dev"
  version_num = "1.0"
}

resource "local_file" "interpolation" {
  filename = "${path.module}/02-interpolation.txt"

  # ${local.app_name} is replaced with "my-app"
  # ${local.environment} is replaced with "dev"
  # The rest is plain text
  content = "App: ${local.app_name} | Env: ${local.environment} | Version: ${local.version_num}"
}

# INTERPOLATION IN FILENAME
resource "local_file" "dynamic_filename" {

  filename = "${path.module}/03-${local.app_name}-${local.environment}.txt"

  content = "The filename of this file was built using interpolation."
}

# HEREDOC STRINGS
resource "local_file" "heredoc" {
  filename = "${path.module}/04-heredoc.txt"

  # Instead of: content = "line one\nline two\nline three"
  # Write this much cleaner version:
  content = <<-EOT
    Welcome to the HCL basics lab.

    This file was created using a heredoc string.
    Heredocs are great for multi-line content like
    config files, scripts, and HTML.

    App    : ${local.app_name}
    Version: ${local.version_num}
  EOT
  # Notice: interpolation works inside heredocs too
}

# STRING FUNCTIONS(Terraform has many built-in functions for working with strings.)

locals {
  raw_name = "  Hello World  "
  tag_value = "production-database-server"
}

resource "local_file" "string_functions" {
  filename = "${path.module}/05-string-functions.txt"

  content = <<-EOT
    Original : "${local.raw_name}"
    upper()  : ${upper(local.raw_name)}
    lower()  : ${lower(local.raw_name)}
    trimspace(): ${trimspace(local.raw_name)}
    replace() : ${replace(local.tag_value, "-", "_")}
    length()  : ${length(local.tag_value)}
  EOT
}

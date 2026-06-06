# ==============================================================
# LAB 06 - Variables
#
# WHAT THIS LAB CONTAINS:
#   - What a variable block is
#   - The difference between locals and variables
#   - How to set a default value
#   - How to pass a value from outside (CLI flag, .tfvars file)
#   - Referencing a variable with var.name
#
# KEY DIFFERENCE:
#   locals  = values you compute INSIDE the config (not passed in)
#   variables = values passed in FROM OUTSIDE the config
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

# VARIABLE BLOCKS
variable "your_name" {
  # description explains what this variable is for
  description = "Your name - used to personalise the output file"

  # type tells Terraform what kind of value to expect
  type = string

  # default is used when you do NOT pass a value from outside.
  # If you do not have a default and do not pass a value,
  # Terraform will prompt you to type one in the terminal.
  default = "DevOps Learner"
}

variable "environment" {
  description = "The deployment environment: dev, staging, or prod"
  type        = string
  default     = "dev"
}

variable "app_port" {
  description = "The port the application listens on"
  type        = number
  default     = 8080
}

variable "enable_debug" {
  description = "Whether to enable debug logging"
  type        = bool
  default     = true
}

# USING VARIABLES
resource "local_file" "profile" {
  filename = "${path.module}/01-profile.txt"

  content = <<-EOT
    Name        : ${var.your_name}
    Environment : ${var.environment}
    App Port    : ${var.app_port}
    Debug Mode  : ${var.enable_debug}
  EOT
}

# VARIABLES VS LOCALS - side by side comparison
# This local USES the variable and computes something new from it
locals {
  # This local cannot be passed in - it is always computed
  app_url = "http://localhost:${var.app_port}"

  # Another local derived from a variable
  log_prefix = "[${upper(var.environment)}]"
}

resource "local_file" "comparison" {
  filename = "${path.module}/02-vars-vs-locals.txt"

  content = <<-EOT
    VARIABLES (passed in from outside):
    var.your_name   = ${var.your_name}
    var.environment = ${var.environment}
    var.app_port    = ${var.app_port}

    LOCALS (computed inside config from variables):
    local.app_url   = ${local.app_url}
    local.log_prefix = ${local.log_prefix}
  EOT
}

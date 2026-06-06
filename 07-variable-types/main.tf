# ==============================================================
# LAB 07 - Variable Types and Validation
#
# WHAT THIS LAB TEACHES:
#   - Typed variables: list, map, object
#   - What happens when you pass the wrong type
#   - Validation rules to reject bad values early
#   - Sensitive variables that are hidden from logs
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

# LIST VARIABLE
variable "availability_zones" {
  description = "List of availability zones to deploy into"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "allowed_ports" {
  description = "List of ports to open in the firewall"
  type        = list(number)
  default     = [80, 443, 22]
}

# MAP VARIABLE
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Project   = "hcl-lab"
    ManagedBy = "Terraform"
  }
}

# OBJECT VARIABLE
variable "database" {
  description = "Database configuration"

  # object() defines the exact shape: field name and its type
  type = object({
    name     = string
    port     = number
    replicas = number
    backup   = bool
  })

  default = {
    name     = "app-db"
    port     = 5432
    replicas = 1
    backup   = false
  }
}

# VALIDATION
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    # contains() checks if the value is in the list
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1

  validation {
    # The value must be between 1 and 10 inclusive
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "instance_count must be between 1 and 10."
  }
}

# SENSITIVE VARIABLE
variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
  default     = "super-secret-do-not-log-this"
}

# OUTPUT FILES
resource "local_file" "types_demo" {
  filename = "${path.module}/01-variable-types.txt"

  content = <<-EOT
    LIST VARIABLES
    --------------
    availability_zones = ${jsonencode(var.availability_zones)}
    allowed_ports      = ${jsonencode(var.allowed_ports)}
    First AZ           = ${var.availability_zones[0]}
    First port         = ${var.allowed_ports[0]}

    MAP VARIABLE
    ------------
    tags = ${jsonencode(var.tags)}

    OBJECT VARIABLE
    ---------------
    database.name     = ${var.database.name}
    database.port     = ${var.database.port}
    database.replicas = ${var.database.replicas}
    database.backup   = ${var.database.backup}

    VALIDATED VARIABLES
    -------------------
    environment    = ${var.environment}
    instance_count = ${var.instance_count}

    SENSITIVE VARIABLE
    ------------------
    db_password = (hidden - will not appear here)
  EOT
}

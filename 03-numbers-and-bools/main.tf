# ==============================================================
# LAB 03 - Numbers and Booleans
#
# WHAT THIS LAB CONTAINS:
#   - The number data type (whole numbers and decimals)
#   - The bool data type (true / false)
#   - Using tostring() to include numbers and bools in strings
#   - Basic arithmetic with numbers
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

# NUMBERS
locals {
  # whole number (integer)
  port = 8080

  # decimal number
  cpu_cores = 2.5

  # numbers used in arithmetic
  base_port   = 8000
  http_port   = 8000 + 80    # 8080 - addition
  https_port  = 8000 + 443   # 8443 - addition
  replica_count = 3
  total_cpu   = 2 * local.replica_count   # 6 - multiplication
}

resource "local_file" "numbers" {
  filename = "${path.module}/01-numbers.txt"

  content = <<-EOT
    NUMBERS
    -------
    port        = ${local.port}
    cpu_cores   = ${local.cpu_cores}

    ARITHMETIC
    ----------
    base_port   = ${local.base_port}
    http_port   = ${local.base_port} + 80  = ${local.http_port}
    https_port  = ${local.base_port} + 443 = ${local.https_port}
    replicas    = ${local.replica_count}
    total_cpu   = 2 * ${local.replica_count} = ${local.total_cpu}
  EOT
}

# BOOLEANS
locals {
  # boolean values - notice: no quotes, lowercase
  enable_logging  = true
  enable_debug    = false
  is_production   = false
  enable_backups  = true
}

resource "local_file" "booleans" {
  filename = "${path.module}/02-booleans.txt"

  content = <<-EOT
    BOOLEANS
    --------
    enable_logging = ${local.enable_logging}
    enable_debug   = ${local.enable_debug}
    is_production  = ${local.is_production}
    enable_backups = ${local.enable_backups}

    NOTE: In a real AWS resource you would use these like:
      enable_dns_support   = true
      enable_dns_hostnames = local.enable_dns
      multi_az             = local.is_production
  EOT
}
# MIXING TYPES IN OUTPUT
locals {
  server_name  = "web-01"
  server_port  = 8080
  server_ready = true
}

resource "local_file" "mixed" {
  filename = "${path.module}/03-mixed-types.txt"

  content = <<-EOT
    Server name  : ${local.server_name}
    Server port  : ${local.server_port}
    Server ready : ${local.server_ready}

    Using tostring() explicitly:
    Port as string: ${tostring(local.server_port)}
    Ready as string: ${tostring(local.server_ready)}
  EOT
}

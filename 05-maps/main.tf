# ==============================================================
# LAB 05 - Maps
#
# WHAT THIS LAB CONTAINS:
#   - What a map is and how to write one
#   - Accessing values by key using dot notation and brackets
#   - keys(), values(), lookup() functions
#   - A practical use case: environment config map
#
# A map stores key-value pairs.
# Think of it like a dictionary or a config object.
# Maps use curly braces: { key = "value" }
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

# A BASIC MAP
locals {
  # A map of string values (like tags on an AWS resource)
  tags = {
    Project     = "hcl-lab"
    Environment = "dev"
    Team        = "platform"
    ManagedBy   = "Terraform"
  }

  # A map of number values
  ports = {
    http  = 80
    https = 443
    ssh   = 22
    app   = 8080
  }
}

resource "local_file" "basic_map" {
  filename = "${path.module}/01-basic-map.txt"

  content = <<-EOT
    tags map:
    ${jsonencode(local.tags)}

    ports map:
    ${jsonencode(local.ports)}
  EOT
}

# ACCESSING MAP VALUES
resource "local_file" "accessing" {
  filename = "${path.module}/02-accessing-map-values.txt"

  content = <<-EOT
    Dot notation:
    tags.Project     = ${local.tags.Project}
    tags.Environment = ${local.tags.Environment}
    ports.http       = ${local.ports.http}

    Bracket notation:
    tags["Team"]     = ${local.tags["Team"]}
    tags["ManagedBy"]= ${local.tags["ManagedBy"]}
    ports["https"]   = ${local.ports["https"]}
  EOT
}

# MAP FUNCTIONS
resource "local_file" "map_functions" {
  filename = "${path.module}/03-map-functions.txt"

  content = <<-EOT
    FUNCTIONS ON THE tags MAP:
    --------------------------
    keys(tags)               = ${jsonencode(keys(local.tags))}
    values(tags)             = ${jsonencode(values(local.tags))}
    lookup(tags,"Team","?")  = ${lookup(local.tags, "Team", "not found")}
    lookup(tags,"Owner","?") = ${lookup(local.tags, "Owner", "not found")}

    merge() - combine two maps:
    ${jsonencode(merge(local.tags, { CostCenter = "engineering" }))}
  EOT
  # lookup(map, key, default)
  # If the key exists, return its value.
  # If the key does NOT exist, return the default instead of erroring.
}

# PRACTICAL EXAMPLE: environment config map
# A very common pattern in Terraform is a map that holds
# different config values per environment.
locals {
  instance_type = {
    dev     = "t2.micro"
    staging = "t2.small"
    prod    = "t3.large"
  }

  # Simulate the current environment
  current_env = "dev"
}

resource "local_file" "practical" {
  filename = "${path.module}/04-environment-map.txt"

  content = <<-EOT
    Instance type map:
    dev     = ${local.instance_type["dev"]}
    staging = ${local.instance_type["staging"]}
    prod    = ${local.instance_type["prod"]}

    Current environment : ${local.current_env}
    Instance type to use: ${local.instance_type[local.current_env]}
  EOT
  # local.instance_type[local.current_env]
  # = local.instance_type["dev"]
  # = "t2.micro"
}

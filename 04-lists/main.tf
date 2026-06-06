# ==============================================================
# LAB 04 - Lists
#
# WHAT THIS LAB CONTAINS:
#   - What a list is and how to write one
#   - Accessing items by index
#   - Getting the length of a list
#   - Joining a list into a single string
#   - Checking if a list contains a value
#
# A list is an ordered collection of values.
# All values in a list should be the same type.
# Lists use square brackets: ["a", "b", "c"]
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

# A BASIC LIST
locals {
  # A list of strings
  regions = ["us-east-1", "us-west-2", "ap-south-1"]

  # A list of numbers
  ports = [80, 443, 8080, 8443]

  # A list of strings (DevOps tools)
  tools = ["Docker", "Terraform", "Kubernetes", "Ansible", "GitHub Actions"]
}

resource "local_file" "basic_list" {
  filename = "${path.module}/01-basic-list.txt"

  content = <<-EOT
    regions = ${jsonencode(local.regions)}
    ports   = ${jsonencode(local.ports)}
    tools   = ${jsonencode(local.tools)}
  EOT
  # jsonencode() is the easiest way to print a full list
}

# ACCESSING LIST ITEMS BY INDEX
resource "local_file" "indexing" {
  filename = "${path.module}/02-indexing.txt"

  content = <<-EOT
    Accessing list items by index (starts at 0):

    regions[0] = ${local.regions[0]}
    regions[1] = ${local.regions[1]}
    regions[2] = ${local.regions[2]}

    ports[0]   = ${local.ports[0]}
    ports[1]   = ${local.ports[1]}
  EOT
}

# USEFUL LIST FUNCTIONS
resource "local_file" "list_functions" {
  filename = "${path.module}/03-list-functions.txt"

  content = <<-EOT
    FUNCTIONS ON THE tools LIST:
    ----------------------------
    length(tools)              = ${length(local.tools)}
    join(", ", tools)          = ${join(", ", local.tools)}
    join(" | ", tools)         = ${join(" | ", local.tools)}
    contains(tools,"Docker")   = ${contains(local.tools, "Docker")}
    contains(tools,"Jenkins")  = ${contains(local.tools, "Jenkins")}
    sort(tools)                = ${jsonencode(sort(local.tools))}

    FUNCTIONS ON THE ports LIST:
    ----------------------------
    length(ports)              = ${length(local.ports)}
    join(", ", ports-as-strs)  = (see console example in README)
  EOT
}

# A PRACTICAL EXAMPLE
# In real Terraform you often need to join a list into a string
# for use in a config file or a tag.
locals {
  allowed_ips  = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  environments = ["dev", "staging", "prod"]
}

resource "local_file" "practical" {
  filename = "${path.module}/04-practical.txt"

  content = <<-EOT
    Firewall allowed IPs:
    ${join("\n    ", local.allowed_ips)}

    Active environments: ${join(", ", local.environments)}
    First environment  : ${local.environments[0]}
    Last environment   : ${local.environments[length(local.environments) - 1]}
    Total environments : ${length(local.environments)}
  EOT
}

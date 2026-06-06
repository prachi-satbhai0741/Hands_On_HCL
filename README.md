# HCL-basics


![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local%20%7C%20random-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Level](https://img.shields.io/badge/level-beginner-brightgreen)
![Labs](https://img.shields.io/badge/labs-14-blue)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square)

Learn HCL from scratch. No AWS account needed. Every lab covers exactly one concept so nothing feels rushed. Run each lab, read the output, then move to the next one.

---

## Before You Start

Install Terraform on your machine:

```bash
# Check if already installed
terraform version

# If not installed, follow:
# https://developer.hashicorp.com/terraform/install
```

That is all you need. No AWS, no cloud account, no extra tools.

---

## How Every Lab Works

Each lab folder has two files:

```
main.tf     - the HCL code with heavy comments explaining every line
README.md   - what the lab teaches and step-by-step instructions
```

Run every lab the same way:

```bash
cd 01-your-first-resource

terraform init      # step 1 - download providers
terraform plan      # step 2 - preview what will happen
terraform apply     # step 3 - run it (type yes when asked)
cat *.txt           # step 4 - read the output files created
terraform destroy   # step 5 - clean up
```

---

## Learning Path

| Lab | Concept |
|-----|---------|
| 01-first-resource | What Terraform does, first resource |
| 02-strings | String type, interpolation, heredoc |
| 03-numbers-and-bools | Number and bool types |
| 04-lists | List type, indexing, join |
| 05-maps | Map type, key-value pairs, lookup |
| 06-variables | What variables are, defaults |
| 07-variable-types | Typed variables, validation |
| 08-locals | Local computed values |
| 09-outputs | Output values, sensitive flag |
| 10-expressions | Conditionals, operators |
| 11-functions | Built-in functions |
| 12-loops-count | count meta-argument |
| 13-loops-for-each | for_each with maps and sets |
| 14-loops-for-expression | for expressions to transform data |

---
Use this repository to learn HCL through simple, practical, hands-on labs.

# 04 - Lists

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-lists-blue)

---

## What You Learn

- How to write a list: `["a", "b", "c"]`
- Accessing items by index (starts at 0)
- `length()` - count items
- `join()` - combine into one string
- `contains()` - check if a value exists
- `sort()` - alphabetical sort

---

## Key Syntax

```hcl
# Define a list
tools = ["Docker", "Terraform", "Kubernetes"]

# Access by index (zero-based)
tools[0]   # "Docker"
tools[1]   # "Terraform"
tools[2]   # "Kubernetes"

# Functions
length(tools)              # 3
join(", ", tools)          # "Docker, Terraform, Kubernetes"
contains(tools, "Docker")  # true
contains(tools, "Jenkins") # false
```

---

## Step-by-Step

**Step 1** - Read `main.tf` and trace through what each function returns.

**Step 2** - Run it:

```bash
cd 04-lists
terraform init
terraform apply
```

**Step 3** - Read each output file:

```bash
cat 01-basic-list.txt
cat 02-indexing.txt
cat 03-list-functions.txt
cat 04-practical.txt
```

**Step 4** - Experiment in the console:

```bash
terraform console
> ["a", "b", "c"][0]
> length(["a", "b", "c"])
> join(", ", ["a", "b", "c"])
> contains(["a", "b", "c"], "b")
> sort(["banana", "apple", "cherry"])
> exit
```

**Step 5** - Clean up:

```bash
terraform destroy
```

---

## Challenge

Add a list local called `team_members = ["Alice", "Bob", "Charlie", "Diana"]` and write a file `05-team.txt` that shows:
- The total number of members
- All names joined with ` and `
- The first member

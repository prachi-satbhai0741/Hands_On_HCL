# 05 - Maps

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-maps-blue)

---

## What You Learn

- How to write a map: `{ key = "value" }`
- Accessing values with dot notation `map.key` and brackets `map["key"]`
- `keys()` - list all keys
- `values()` - list all values
- `lookup()` - safe access with a default value
- `merge()` - combine two maps

---

## Key Syntax

```hcl
# Define a map
tags = {
  Project = "my-app"
  Env     = "dev"
}

# Access values
tags.Project       # "my-app"
tags["Project"]    # "my-app"  (same result)

# Functions
keys(tags)                        # ["Env", "Project"]
lookup(tags, "Env", "unknown")    # "dev"
lookup(tags, "Owner", "unknown")  # "unknown" (key missing, returns default)
```

---

## Step-by-Step

**Step 1** - Read `main.tf` and notice the difference between a list `[...]` and a map `{...}`.

**Step 2** - Run it:

```bash
cd 05-maps
terraform init
terraform apply
```

**Step 3** - Read each output file:

```bash
cat 01-basic-map.txt
cat 02-accessing-map-values.txt
cat 03-map-functions.txt
cat 04-environment-map.txt
```

**Step 4** - Try in the console:

```bash
terraform console
> {"a" = 1, "b" = 2}.a
> keys({"x" = 1, "y" = 2})
> lookup({"env" = "dev"}, "env", "unknown")
> lookup({"env" = "dev"}, "region", "us-east-1")
> merge({"a" = 1}, {"b" = 2})
> exit
```

**Step 5** - Clean up:

```bash
terraform destroy
```

---

## Challenge

Add a map called `replica_count = { dev = 1, staging = 2, prod = 5 }` and write a file `05-replicas.txt` that shows the replica count for each environment.

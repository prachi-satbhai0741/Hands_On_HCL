# 07 - Variable Types and Validation

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-variable%20types%20%7C%20validation-blue)

---

## What You Learn

- `list(string)` and `list(number)` variable types
- `map(string)` variable type
- `object({...})` variable type for structured config
- `validation` block to reject bad values with clear errors
- `sensitive = true` to hide secrets from logs

---

## Type Syntax

```hcl
variable "zones"    { type = list(string) }
variable "tags"     { type = map(string) }
variable "db" {
  type = object({
    name = string
    port = number
  })
}
```

---

## Step-by-Step

**Step 1** - Run with defaults:

```bash
cd 07-variable-types
terraform init
terraform apply
cat 01-variable-types.txt
```

**Step 2** - Test validation by passing a bad value:

```bash
terraform plan -var="environment=production"
```

You should see an error:
```
Error: environment must be one of: dev, staging, prod.
```

This is validation working correctly. Fix it:

```bash
terraform plan -var="environment=prod"
```

**Step 3** - Test the instance_count validation:

```bash
terraform plan -var="instance_count=50"
# Error: instance_count must be between 1 and 10.

terraform plan -var="instance_count=5"
# Works fine
```

**Step 4** - Override the object variable from CLI:

```bash
terraform apply -var='database={"name":"prod-db","port":5432,"replicas":3,"backup":true}'
cat 01-variable-types.txt
```

**Step 5** - Clean up:

```bash
terraform destroy
```

---

## Challenge

Add a variable `allowed_envs` of type `list(string)` with a default of `["dev", "staging"]` and a validation that rejects the value if its length is 0.

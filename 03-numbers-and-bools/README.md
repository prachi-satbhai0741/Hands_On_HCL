# 03 - Numbers and Booleans

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-numbers%20%7C%20booleans-blue)

---

## What You Learn

- Number type: integers and decimals, basic arithmetic
- Boolean type: `true` and `false`
- The difference between `"8080"` (string) and `8080` (number)
- The difference between `"true"` (string) and `true` (bool)
- `tostring()` for type conversion

---

## Key Rules

```hcl
# NUMBER - no quotes
port = 8080
price = 3.14

# BOOL - no quotes, lowercase
enabled = true
debug   = false

# THESE ARE STRINGS, not numbers or bools
port_string    = "8080"
enabled_string = "true"
```

---

## Step-by-Step

**Step 1** - Read `main.tf` and pay attention to which values have quotes and which do not.

**Step 2** - Run it:

```bash
cd 03-numbers-and-bools
terraform init
terraform apply
```

**Step 3** - Read the output files:

```bash
cat 01-numbers.txt
cat 02-booleans.txt
cat 03-mixed-types.txt
```

**Step 4** - Try arithmetic in the console:

```bash
terraform console
> 8000 + 80
> 8000 + 443
> 2 * 5
> 10 / 3
> tostring(8080)
> exit
```

**Step 5** - Clean up:

```bash
terraform destroy
```

---

## Challenge

Add locals for `disk_size_gb = 100` and `enable_monitoring = true`. Write a new file `04-server-spec.txt` that shows both values.

# 02 - Strings

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-strings-blue)

---

## What You Learn

- Plain string values
- String interpolation with `${...}`
- Heredoc multi-line strings with `<<-EOT`
- Four common string functions: `upper`, `lower`, `trimspace`, `replace`

---

## Key Syntax

**Plain string:**
```hcl
content = "hello world"
```

**Interpolation - embed a value inside a string:**
```hcl
content = "app is ${local.app_name} in ${local.environment}"
# result: "app is my-app in dev"
```

**Heredoc - multi-line string:**
```hcl
content = <<-EOT
  line one
  line two
  line three
EOT
```

---

## Step-by-Step

**Step 1** - Read `main.tf` top to bottom before running anything.

**Step 2** - Initialize and apply:

```bash
cd 02-strings
terraform init
terraform apply
```

**Step 3** - Read each output file in order:

```bash
cat 01-plain-string.txt
cat 02-interpolation.txt
cat 03-my-app-dev.txt
cat 04-heredoc.txt
cat 05-string-functions.txt
```

**Step 4** - Notice how the values from `locals` appeared in the files.

**Step 5** - Try the interactive console to test string functions:

```bash
terraform console
> upper("hello")
> lower("TERRAFORM")
> trimspace("  spaces  ")
> replace("hello-world", "-", "_")
> exit
```

**Step 6** - Clean up:

```bash
terraform destroy
```

---

## Challenge

In `main.tf`, add a new local called `team = "platform"` and a new `local_file` resource that writes a file named `06-team-info.txt` with this content (using interpolation):

```
App   : my-app
Team  : platform
Env   : dev
```

# 06 - Variables

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-variables-blue)

---

## What You Learn

- Declaring a `variable` block with description, type, and default
- Referencing a variable with `var.name`
- Passing values from the CLI with `-var`
- Passing values with a `.tfvars` file
- The difference between `variable` and `locals`

---

## locals vs variables

```
locals    = computed INSIDE the config, cannot be overridden
variables = designed to be PASSED IN from outside
```

---

## Step-by-Step

**Step 1** - Run with defaults (no values passed in):

```bash
cd 06-variables
terraform init
terraform apply
cat 01-profile.txt
```

You will see the default values from the variable blocks.

**Step 2** - Override a variable from the CLI:

```bash
terraform apply -var="your_name=YourActualName"
cat 01-profile.txt
```

The name changes. The defaults are still used for the other variables.

**Step 3** - Override multiple variables:

```bash
terraform apply -var="your_name=YourName" -var="environment=prod" -var="app_port=3000"
cat 01-profile.txt
cat 02-vars-vs-locals.txt
```

**Step 4** - Use a `.tfvars` file (the most common way in real projects):

```bash
# Create a file called dev.tfvars
cat > dev.tfvars << EOF
your_name    = "YourName"
environment  = "dev"
app_port     = 8080
enable_debug = true
EOF

terraform apply -var-file="dev.tfvars"
```

**Step 5** - Clean up:

```bash
terraform destroy
```

---

## Five Ways to Pass a Variable (highest priority first)

```
1. -var flag on CLI           terraform apply -var="name=value"
2. -var-file flag on CLI      terraform apply -var-file="prod.tfvars"
3. terraform.tfvars file      auto-loaded if it exists
4. TF_VAR_ env variable       export TF_VAR_name=value
5. default in variable block  default = "value"
```

---

## Challenge

Create a file `prod.tfvars` with `environment = "prod"` and `enable_debug = false`. Apply it and observe how the output file changes.

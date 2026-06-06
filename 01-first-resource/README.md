# 01 - First Resource

![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.5-623CE4?logo=terraform&logoColor=white)
![Provider](https://img.shields.io/badge/provider-local-gray)
![AWS Required](https://img.shields.io/badge/AWS-not%20required-success)
![Difficulty](https://img.shields.io/badge/difficulty-beginner-brightgreen)
![Concept](https://img.shields.io/badge/concept-resource%20block-blue)

---

## What You Learn

- What a Terraform config file looks like
- The three blocks every project needs: `terraform {}`, `provider {}`, `resource {}`
- How to create your first resource (a local file)
- The four commands you will use in every lab

---

## The Three Blocks

```
terraform {}    - tells Terraform what version and providers to use
provider {}     - configures the provider plugin
resource {}     - describes one piece of infrastructure to create
```

---

## Step-by-Step

**Step 1 - Read the file first**

Open `main.tf` and read every comment. Do not run anything yet. The comments explain each line.

**Step 2 - Initialize**

```bash
cd 01-first-resource
terraform init
```

This downloads the `local` provider plugin into a `.terraform/` folder. You only need to run this once per project.

**Step 3 - Preview**

```bash
terraform plan
```

Terraform reads your config and tells you what it *will* do without actually doing it. You should see `+ create` next to two resources.

**Step 4 - Apply**

```bash
terraform apply
```

Type `yes` when prompted. Terraform creates the two files.

**Step 5 - Check the output**

```bash
cat hello.txt
cat about.txt
```

You should see the content you defined in `main.tf`.

**Step 6 - Look at the state file**

```bash
cat terraform.tfstate
```

Terraform created this file automatically. It tracks everything it manages. Do not edit it by hand.

**Step 7 - Clean up**

```bash
terraform destroy
```

Type `yes`. Terraform deletes the files it created. The `.terraform/` folder stays.

---

## What Just Happened

```
main.tf  -->  terraform plan  -->  terraform apply  -->  hello.txt created
(code)   (preview)           (execute)              (real result)
```

---

## Challenge

Add a third `resource "local_file"` block to `main.tf` that creates a file called `my-name.txt` with your name as the content. Run `terraform apply` again and check the file was created.

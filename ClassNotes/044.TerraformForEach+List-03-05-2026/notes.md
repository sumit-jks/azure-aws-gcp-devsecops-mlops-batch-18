## Terraform: `for_each + list` Comprehensive Notes

# 1. Requirement

Hame multiple Azure Resource Groups create karne hain.

Example:

```hcl
the_mishras_family = [
  "jhandu_ji_rg",
  "teju_ji_rg345",
  "teju_ji_rg",
  "rondu_ji_rg254",
  "teju_ji_rg",
  "teju_ji_rg2",
  "teju_ji_rg23",
  "teju_ji_rg54",
  "teju_ji_rg65",
  "teju_ji45"
]
```

Goal:

Har list item ke naam se ek Resource Group create ho.

---

# 2. Without Loop Problem

Agar loop nahi use karenge, toh har RG ke liye alag resource block likhna padega:

```hcl
resource "azurerm_resource_group" "rg1" {
  name     = "jhandu_ji_rg"
  location = "westus"
}

resource "azurerm_resource_group" "rg2" {
  name     = "teju_ji_rg345"
  location = "westus"
}
```

Problem:

Code duplication badhega.

Jab jab code me duplicacy hogi, tab tab code optimization ki need hogi.

---

# 3. Looping in Terraform

Terraform me looping ke liye common options:

```hcl
count
for_each
for expression
dynamic block
```

Is example me hum use kar rahe hain:

```hcl
for_each
```

---

# 4. What is `for_each`?

`for_each` Terraform ka meta-argument hai.

Ye ek resource block ko multiple baar create kar sakta hai.

Example:

```hcl
resource "azurerm_resource_group" "rg" {
  for_each = toset(var.the_mishras_family)

  name     = each.key
  location = "westus"
}
```

Meaning:

List ke har item ke liye ek Resource Group create karo.

---

# 5. Important Rule of `for_each`

`for_each` directly list accept nahi karta.

It accepts:

```hcl
map
set of strings
```

Isliye list ko set me convert karte hain:

```hcl
toset(var.the_mishras_family)
```

---

# 6. List vs Set

## List

List ordered hoti hai aur duplicates allow karti hai.

Example:

```hcl
["teju_ji_rg", "teju_ji_rg", "rondu_ji_rg254"]
```

Yaha duplicate allowed hai.

## Set

Set unordered hota hai aur duplicates remove kar deta hai.

Example:

```hcl
toset(["teju_ji_rg", "teju_ji_rg", "rondu_ji_rg254"])
```

Output logically becomes:

```hcl
[
  "teju_ji_rg",
  "rondu_ji_rg254"
]
```

Duplicate `teju_ji_rg` remove ho jayega.

---

# 7. Your Code Explanation

## Variable

```hcl
variable "the_mishras_family" {}
```

Ye variable input lega.

Better version:

```hcl
variable "the_mishras_family" {
  type = list(string)
}
```

---

## Resource Group

```hcl
resource "azurerm_resource_group" "rg" {
  for_each = toset(var.the_mishras_family)

  name     = each.key
  location = "westus"
}
```

Explanation:

```hcl
for_each = toset(var.the_mishras_family)
```

List ko set me convert karega.

```hcl
name = each.key
```

Har item ka naam Resource Group name banega.

For set, `each.key` and `each.value` mostly same hote hain.

You can also write:

```hcl
name = each.value
```

---

# 8. Actual Input

```hcl
the_mishras_family = [
  "jhandu_ji_rg",
  "teju_ji_rg345",
  "teju_ji_rg",
  "rondu_ji_rg254",
  "teju_ji_rg",
  "teju_ji_rg2",
  "teju_ji_rg23",
  "teju_ji_rg54",
  "teju_ji_rg65",
  "teju_ji45"
]
```

Notice:

```hcl
"teju_ji_rg"
```

is repeated two times.

Because we used:

```hcl
toset()
```

Terraform duplicate remove kar dega.

So total input list has 10 items, but actual unique Resource Groups will be 9.

---

# 9. Resource Groups Created

Terraform will create RGs like:

```text
jhandu_ji_rg
teju_ji_rg345
teju_ji_rg
rondu_ji_rg254
teju_ji_rg2
teju_ji_rg23
teju_ji_rg54
teju_ji_rg65
teju_ji45
```

All in same location:

```text
westus
```

---

# 10. Why Duplicate Removed?

Because:

```hcl
for_each = toset(var.the_mishras_family)
```

Set ka rule:

```text
Duplicates not allowed
```

So duplicate `teju_ji_rg` sirf ek baar create hoga.

---

# 11. `each.key` vs `each.value`

## When using set

```hcl
for_each = toset(["rg1", "rg2"])
```

Then:

```hcl
each.key   = "rg1"
each.value = "rg1"
```

For set, both are same.

---

## When using map

```hcl
for_each = {
  dev  = "dev-rg"
  prod = "prod-rg"
}
```

Then:

```hcl
each.key   = dev
each.value = dev-rg
```

Map me key aur value different ho sakte hain.

---

# 12. Why `for_each + list` is Limited?

Current code me location hardcoded hai:

```hcl
location = "westus"
```

So all RGs same region me banenge.

Agar har RG ka different location chahiye, then `for_each + list` best option nahi hai.

For different locations, use:

```hcl
for_each + map
```

Example:

```hcl
resource_groups = {
  rg1 = "westus"
  rg2 = "eastus"
}
```

---

# 13. Complete Code

## `main.tf`

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "the_mishras_family" {
  type = list(string)
}

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.the_mishras_family)

  name     = each.key
  location = "westus"
}
```

---

## `terraform.tfvars`

```hcl
the_mishras_family = [
  "jhandu_ji_rg",
  "teju_ji_rg345",
  "teju_ji_rg",
  "rondu_ji_rg254",
  "teju_ji_rg",
  "teju_ji_rg2",
  "teju_ji_rg23",
  "teju_ji_rg54",
  "teju_ji_rg65",
  "teju_ji45"
]
```

---

# 14. Terraform Commands

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
```

---

# 15. Interview Explanation

`for_each` is used when we want to create multiple resources from a collection. In this example, we are taking a list of resource group names as input, converting it into a set using `toset()`, and then Terraform creates one resource group for every unique item. Since set does not allow duplicates, duplicate names are automatically removed. Here, all resource groups are created in the same Azure region because location is hardcoded as `westus`.

---

# 16. Simple Hinglish Summary

`list` me duplicates allowed hote hain.

`for_each` list directly accept nahi karta.

Isliye hum list ko set me convert karte hain:

```hcl
toset(var.the_mishras_family)
```

Set duplicates hata deta hai.

Fir Terraform har unique item ke liye ek Resource Group create karta hai.

All RG same location me banenge:

```hcl
location = "westus"
```

Different location chahiye toh `for_each + map` use karna padega.

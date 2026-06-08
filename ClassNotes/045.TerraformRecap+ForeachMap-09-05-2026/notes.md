# Terraform `for_each` + List + Map — Comprehensive Notes

These notes explain the complete concept of **Terraform `for_each`**, **List**, **Set**, and **Map** in a very practical and beginner-friendly way. The diagram focuses heavily on understanding data types and how `for_each` behaves with them. 

---

# 1. What is `for_each` in Terraform?

`for_each` is a **Meta Argument** in Terraform.

Meta arguments are special arguments that control how Terraform creates or manages resources.

According to the notes, Terraform has multiple meta arguments: 

* `for_each`
* `depends_on`
* `count`
* `lifecycle`

---

# 2. What Does `for_each` Do?

`for_each` creates **multiple copies** of a resource dynamically.

Instead of writing:

```hcl
resource "azurerm_resource_group" "r1" {
  name     = "rg1"
  location = "eastus"
}

resource "azurerm_resource_group" "r2" {
  name     = "rg2"
  location = "eastus"
}

resource "azurerm_resource_group" "r3" {
  name     = "rg3"
  location = "eastus"
}
```

You can automate it using:

```hcl
resource "azurerm_resource_group" "rgs" {
  for_each = toset(["rg1", "rg2", "rg3"])

  name     = each.value
  location = "eastus"
}
```

Terraform internally creates:

```hcl
rg1
rg2
rg3
```

automatically. 

---

# 3. Important Rule of `for_each`

The diagram clearly mentions:

> `for_each` only accepts:

* Set of Strings
* Map



That means:

✅ Allowed:

* Set
* Map

❌ Not Allowed Directly:

* List

That is why we use:

```hcl
toset()
```

---

# 4. Variable Types in Terraform

Terraform variables are divided into two categories:

---

# A. Primitive / Singular Types

These store a single value.

---

## String

Stores text/alphanumeric values.

```hcl
name = "dhondhu"
```

Rules:

* Always inside `" "`
* Supports alphabets, numbers, symbols

---

## Number

Stores numeric values.

```hcl
age = 16
```

Rules:

* No double quotes

---

## Boolean

Stores:

* `true`
* `false`

Example:

```hcl
intelligent = true
```

Rules:

* No quotes

---

# B. Collection / Plural Types

These store multiple values.

---

# 5. List in Terraform

A List stores:

* Multiple values
* Same datatype elements
* Duplicate values allowed

Example:

```hcl
names = ["dhondhu", "tondu", "rondu", "rondu"]
```

Important:

* Uses Square Brackets `[]`
* Duplicates allowed
* Ordered collection

Examples:

```hcl
age = [23, 16, 76]

intelligent = [true, false, true]
```



---

# 6. Set in Terraform

Set is similar to List BUT:

❌ No duplicate values allowed.

Example:

```hcl
names = ["dhondhu", "tondu", "rondu"]
```

If duplicate values exist, Terraform automatically removes them.

---

## Example

### List

```hcl
["rg1", "rg2", "rg1"]
```

### Converted to Set

```hcl
toset(["rg1", "rg2", "rg1"])
```

Result:

```hcl
["rg1", "rg2"]
```

Duplicate `rg1` removed.

---

# 7. Why `toset()` is Important?

Because `for_each` cannot directly use a list.

Example:

❌ Wrong

```hcl
for_each = ["rg1", "rg2"]
```

✅ Correct

```hcl
for_each = toset(["rg1", "rg2"])
```

The diagram says:

> "Jab list pe toset laga dete hai toh list se set ban jata hai"

Meaning:
When we apply `toset()` on a list, it becomes a Set. 

---

# 8. Understanding Functions in Terraform

Functions work like machines.

Diagram Explanation:

```text
Input → Function → Output
```

Example:

```hcl
toset(["rg1", "rg2"])
```

Input:

```hcl
["rg1", "rg2"]
```

Function:

```hcl
toset()
```

Output:

```hcl
set(string)
```



---

# 9. Symbols Used in Terraform

| Symbol | Meaning     |
| ------ | ----------- |
| `()`   | Parenthesis |
| `[]`   | List / Set  |
| `{}`   | Block / Map |



---

# 10. Understanding Map in Terraform

Map stores data in:

```text
key = value
```

format.

Example:

```hcl
people = {
  name = "tinku"
  age  = 54
  smart = true
}
```

---

# Important Rules of Map

## Rule 1

Map always uses:

```hcl
{}
```

Curly braces.

---

## Rule 2

Data format:

```hcl
key = value
```

---

## Rule 3

Key is always STRING.

Value can be:

* String
* Number
* Boolean
* List
* Object

The diagram clearly states:

> Key is always string
> Value kuch bhi ho sakta hai



---

# 11. Example of Map

```hcl
rg_names = {
  name     = "rg-white"
  location = "westeurope"
}
```

Here:

| Key      | Value      |
| -------- | ---------- |
| name     | rg-white   |
| location | westeurope |



---

# 12. `for_each` with List

Example:

```hcl
resource "azurerm_resource_group" "rgs" {

  for_each = toset(["rg1", "rg2", "rg3"])

  name     = each.value
  location = "eastus"
}
```

---

# What Happens Internally?

Terraform creates 3 copies:

```hcl
rg1
rg2
rg3
```

---

# each.key and each.value

For Sets:

```text
each.key   = rg1
each.value = rg1

each.key   = rg2
each.value = rg2

each.key   = rg3
each.value = rg3
```

Because Set only stores values.



---

# 13. Limitation of `for_each + List`

The diagram explains:

All resource groups are being created in SAME location.

```hcl
location = "eastus"
```

Problem:

We want:

* Different RG names
* Different locations

List cannot easily manage paired values.

So we use:

✅ Map



---

# 14. `for_each` with Map

Example:

```hcl
resource "azurerm_resource_group" "rgs" {

  for_each = {
    rg1 = "westus"
    rg2 = "eastus"
  }

  name     = each.key
  location = each.value
}
```

---

# Internal Understanding

| each.key | each.value |
| -------- | ---------- |
| rg1      | westus     |
| rg2      | eastus     |

Terraform creates:

```hcl
RG Name: rg1
Location: westus
```

```hcl
RG Name: rg2
Location: eastus
```

---

# 15. Major Advantage of Map

Now every resource can have:

* Different name
* Different configuration
* Different location

This is why:
✅ `for_each + map` is extremely powerful.

---

# 16. How Many Copies Will Terraform Create?

## Case 1 — List / Set

```hcl
toset(["rg1", "rg2", "rg3"])
```

Copies created:

```text
3
```

Because 3 elements exist.

---

## Case 2 — Map

```hcl
{
  rg1 = "westus"
  rg2 = "eastus"
}
```

Copies created:

```text
2
```

Because 2 keys exist.

The diagram states:

> jitni map me keys hogi utni copy banegi



---

# 17. Real Enterprise Example

## Variable

```hcl
variable "resource_groups" {

  default = {
    rg-dev  = "eastus"
    rg-qa   = "westus"
    rg-prod = "centralindia"
  }
}
```

---

## Resource

```hcl
resource "azurerm_resource_group" "rgs" {

  for_each = var.resource_groups

  name     = each.key
  location = each.value
}
```

---

# Output

| Resource Group | Location     |
| -------------- | ------------ |
| rg-dev         | eastus       |
| rg-qa          | westus       |
| rg-prod        | centralindia |

---

# 18. Difference Between List, Set, and Map

| Feature                        | List               | Set                | Map            |
| ------------------------------ | ------------------ | ------------------ | -------------- |
| Duplicates                     | Allowed            | Not Allowed        | Keys Unique    |
| Ordering                       | Ordered            | Unordered          | Key-Based      |
| Syntax                         | `[]`               | `[]`               | `{}`           |
| Stores                         | Values             | Unique Values      | Key-Value      |
| Best For                       | Simple Collections | Unique Collections | Configurations |
| Works Directly with `for_each` | ❌                  | ✅                  | ✅              |

---

# 19. Common Interview Questions

## Q1. What does `for_each` accept?

Answer:

* Set of Strings
* Map

---

## Q2. Why do we use `toset()`?

Answer:
Because `for_each` cannot directly use a list.

---

## Q3. Difference between List and Set?

| List               | Set                |
| ------------------ | ------------------ |
| Duplicates allowed | Duplicates removed |

---

## Q4. Difference between `count` and `for_each`?

| count                          | for_each                    |
| ------------------------------ | --------------------------- |
| Index Based                    | Key Based                   |
| count.index                    | each.key / each.value       |
| Better for identical resources | Better for unique resources |

---

# 20. Important Production Understanding

In real DevOps projects:

✅ `for_each + map` is heavily used for:

* Resource Groups
* Virtual Networks
* Subnets
* NSGs
* Kubernetes Namespaces
* IAM Users
* Storage Accounts

Because every resource usually has:

* Different names
* Different locations
* Different configurations

---

# 21. Final Summary

## `for_each`

* Meta argument
* Creates multiple resource copies

---

## `for_each` Supports

✅ Set
✅ Map

---

## List

* Ordered
* Duplicates allowed

---

## Set

* Unique values only

---

## Map

* Key = Value structure
* Key always string
* Value can be anything

---

## `toset()`

Converts list → set.

---

## Best Practice

For enterprise Terraform:

* Use `for_each + map`
* Avoid hardcoding resources
* Keep infrastructure dynamic and scalable

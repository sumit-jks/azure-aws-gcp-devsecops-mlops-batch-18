# Comprehensive Notes on Terraform Variables, Data Types, for_each, Maps & Modules

These notes are based on the uploaded diagram/PDF. 

---

# 1. Terraform Modules

Terraform modules help organize infrastructure code into reusable components.

## Types of Modules

### 1. Child Module

A reusable module that contains infrastructure code.

Example:

* Resource Groups
* Virtual Networks
* AKS Cluster
* Storage Account

### 2. Parent Module

The main module that calls child modules.

Parent module responsibilities:

* Calls child modules
* Passes variables
* Controls environments

---

## Real World Analogy

Think of:

* **Parent Module** = Restaurant Manager
* **Child Modules** = Different chefs

Each chef performs a specialized task.

---

# 2. Variables in Terraform

Variables make Terraform code dynamic and reusable.

---

## Lifecycle of Variables

Terraform variables generally follow 3 steps:

| Step    | Description          |
| ------- | -------------------- |
| Declare | Create variable      |
| Assign  | Give value           |
| Use     | Use inside resources |

---

## Variable Declaration

```hcl
variable "rg_name" {}
```

This only declares the variable.

---

## Assigning Value

Usually done in:

```hcl
terraform.tfvars
```

Example:

```hcl
rg_name = "rg-dev"
```

---

## Using Variable

```hcl
name = var.rg_name
```

`var.` is used to access variables.

---

# 3. Terraform Variable Types

Terraform supports multiple data types.

---

# 4. String Type

String stores text/alphanumeric values.

Example:

```hcl
"devops"
"rg-prod"
"hello123"
```

---

# 5. Number Type

Stores numeric values.

Example:

```hcl
10
25
100
```

---

# 6. Boolean Type

Stores:

```hcl
true
false
```

Used for enabling/disabling features.

Example:

```hcl
enable_monitoring = true
```

---

# 7. List Type

A list stores:

* Multiple values
* Same datatype elements
* Ordered collection
* Duplicates allowed

Example:

```hcl
[
  "laal-lipistic",
  "blue-lipistic",
  "green-lipistic"
]
```

Important:

* Index based
* Duplicate values allowed

---

## Example

```hcl
students = ["adam", "ale", "tinku"]
```

Access:

```hcl
students[0]
```

---

# 8. Set Type

A set:

* Stores same datatype elements
* Removes duplicates automatically
* Unordered collection

Example:

```hcl
[
  "laal-lipistic",
  "blue-lipistic",
  "green-lipistic"
]
```

---

## Difference Between List and Set

| Feature   | List       | Set            |
| --------- | ---------- | -------------- |
| Order     | Maintained | Not maintained |
| Duplicate | Allowed    | Not allowed    |
| Index     | Supported  | Not supported  |

---

# 9. Map Type

A map stores:

* Key-value pairs
* Keys are unique
* Values can be any datatype

Example:

```hcl
{
  lipistic = "laal"
  blush    = "pink"
  powder   = "ponds"
}
```

---

## Important Rules of Map

### Key

* Always string
* Must be unique

### Value

Can be:

* String
* Number
* Boolean
* List
* Object

---

# 10. Real World Map Examples

---

## Student Marks Example

Wrong approach:

```hcl
students = ["adam", "ale", "tinku"]
marks    = [54, 87, 98]
```

Problem:

* Difficult to identify which mark belongs to which student.

---

## Correct Approach Using Map

```hcl
students_marks = {
  adam  = 54
  ale   = 87
  tinku = 94
}
```

Now mapping becomes easy.

---

# 11. Resource Groups with Locations

---

## Wrong Approach

```hcl
rgs = ["rg-adam", "rg-ale"]
locations = ["westus", "eastus"]
```

Problem:

* No direct relationship.

---

## Correct Approach Using Map

```hcl
rgs = {
  "rg-adam"  = "westus"
  "rg-ale"   = "eastus"
  "rg-tinku" = "centralindia"
}
```

---

# 12. Looping in Terraform

Terraform mainly supports:

| Loop     | Usage       |
| -------- | ----------- |
| count    | Old style   |
| for_each | Recommended |

---

# 13. Count Loop

Count creates resources based on numeric index.

Example:

```hcl
count = 3
```

Issues:

* Index shifting problem
* Difficult state management
* Not ideal for production

The diagram even mentions:

> “count useless – iska koi use nahi karta duniya me” (practical teaching humor)

Meaning:

* In modern production systems, `for_each` is preferred.

---

# 14. for_each Loop

`for_each` creates multiple resources dynamically.

It works with:

* Set
* Map

---

# 15. Important Concept

## One Resource Block = One Real Infrastructure Object

Example:

```hcl
resource "azurerm_resource_group" "rg" {
}
```

Represents:

* One actual Azure Resource Group

---

# 16. Terraform Functions

Terraform functions work like:

```text
Input → Machine → Output
```

Example:

* `toset()` converts list into set

---

# 17. toset() Function

## Syntax

```hcl
toset(<input>)
```

---

## Example

```hcl
toset(["a", "b", "c"])
```

Output:

* Set with unique values

---

# 18. for_each with Set

Example:

```hcl
resource "azurerm_resource_group" "rg" {

  for_each = toset([
    "rg-lipistic",
    "rg-maskara",
    "rg-bindi"
  ])

  name     = each.value
  location = "West Europe"
}
```

---

# 19. What Happens Internally?

Terraform expands the block multiple times.

Equivalent:

```hcl
resource "azurerm_resource_group" "rg[rg-lipistic]" {}
resource "azurerm_resource_group" "rg[rg-maskara]" {}
resource "azurerm_resource_group" "rg[rg-bindi]" {}
```

---

# 20. each.value

In Set/List based for_each:

```hcl
each.value
```

contains actual value.

Example:

```hcl
each.value = "rg-lipistic"
```

---

# 21. State File Behavior

Each generated resource gets:

* Separate entry in Terraform state

This is very important.

Terraform tracks each resource independently.

---

# 22. for_each with Map

This is most common in production.

Example:

```hcl
resource "azurerm_resource_group" "rg" {

  for_each = {
    "rg-adam"  = "westus"
    "rg-ale"   = "eastus"
    "rg-tinku" = "centralindia"
  }

  name     = each.key
  location = each.value
}
```

---

# 23. Important Concepts

## each.key

Represents:

* Map key

Example:

```hcl
each.key = "rg-adam"
```

---

## each.value

Represents:

* Map value

Example:

```hcl
each.value = "westus"
```

---

# 24. Internal Expansion of Map for_each

Terraform internally creates:

```hcl
resource "azurerm_resource_group" "rg[rg-adam]" {}
resource "azurerm_resource_group" "rg[rg-ale]" {}
resource "azurerm_resource_group" "rg[rg-tinku]" {}
```

---

# 25. Production Level Understanding

The diagram highlights:

> “for_each ek ek karke jaega aur block ki copy banaega”

Meaning:

* Terraform duplicates the resource block internally for every key.

---

# 26. Why for_each is Powerful

Advantages:

✅ Stable resource tracking
✅ Better state management
✅ No index shifting
✅ Easier updates
✅ Safer in production
✅ Cleaner infrastructure code

---

# 27. Common Production Use Cases

---

## Multiple Resource Groups

```hcl
resource_groups = {
  rg-dev  = "westus"
  rg-prod = "eastus"
}
```

---

## Multiple Storage Accounts

```hcl
storage_accounts = {
  stdev  = "Standard_LRS"
  stprod = "Premium_LRS"
}
```

---

## Multiple Virtual Machines

```hcl
vms = {
  vm1 = "Standard_B2s"
  vm2 = "Standard_D2s_v3"
}
```

---

# 28. Nested Maps

The diagram mentions:

> Nested Map (Production me use hota hai)

Nested maps are heavily used in enterprise Terraform.

---

## Example

```hcl
resource_groups = {

  dev = {
    name     = "rg-dev"
    location = "westus"
  }

  prod = {
    name     = "rg-prod"
    location = "eastus"
  }
}
```

---

# 29. Benefits of Nested Maps

✅ Environment based infra
✅ Cleaner code
✅ Enterprise scalability
✅ Better automation
✅ Easy module integration

---

# 30. Interview Important Points

---

## Difference Between count and for_each

| count                    | for_each               |
| ------------------------ | ---------------------- |
| Uses index               | Uses keys              |
| Index shifting issue     | Stable                 |
| Less readable            | More readable          |
| Not ideal for production | Production recommended |

---

## Difference Between List and Map

| List             | Map             |
| ---------------- | --------------- |
| Ordered          | Key-value       |
| Access via index | Access via key  |
| Less meaningful  | More meaningful |

---

# 31. Most Important Production Concepts

---

## Infrastructure as Code Principle

Terraform follows:

> “Code hi satya hai”

Meaning:

* Infrastructure state depends on code.

If code changes:

* Infrastructure changes.

---

# 32. Terraform State File Importance

Terraform state file:

* Tracks resources
* Maps cloud infra to Terraform code
* Helps detect drift
* Maintains dependency graph

---

# 33. Best Practices

---

## Use for_each Instead of count

Preferred in production.

---

## Use Maps for Meaningful Data

Bad:

```hcl
["westus", "eastus"]
```

Good:

```hcl
{
  rg1 = "westus"
}
```

---

## Use Variables Everywhere

Avoid hardcoding.

---

## Use Modules

Reusable infrastructure.

---

## Keep State Secure

Store remotely:

* Azure Storage Account
* AWS S3
* GCS Bucket

---

# 34. Common Beginner Mistakes

---

## Hardcoding Values

Wrong:

```hcl
name = "rg-prod"
```

Better:

```hcl
name = var.rg_name
```

---

## Using count Everywhere

Can create resource recreation issues.

---

## Not Understanding each.key vs each.value

Very common confusion.

---

# 35. Final Summary

This diagram primarily teaches:

* Terraform variable system
* Terraform data types
* Difference between List, Set, Map
* Production usage of `for_each`
* `each.key` and `each.value`
* Terraform functions like `toset()`
* Resource expansion concept
* State file understanding
* Nested map concepts
* Production best practices

The core production learning is:

> `for_each + map` is one of the most powerful Terraform patterns used in real enterprise infrastructure automation.


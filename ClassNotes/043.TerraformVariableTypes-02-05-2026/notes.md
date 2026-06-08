# 📘 Terraform + Azure + Variables (Complete Notes)

## 🔰 1. Prerequisites (Foundation Setup)

According to the **top section of the diagram (page 1)** :

Before starting Terraform, you must have:

### ✅ Tools Installation

* Install **Terraform CLI**
* Install **VS Code**

  * Add **Terraform Extension**
* Install **Azure CLI (`az cli`)**

### ✅ Access Requirements

* You must have **Contributor Role** on Azure Subscription

### ✅ Supporting Tools

* Basic understanding of:

  * **Nginx**
  * **Ansible**

### 💡 Real Insight (from diagram)

> “Content is only 20%, main is personality + communication”
> 👉 Meaning:

* DevOps is not just tools
* **Communication + confidence = success in interviews**

---

# 🏗️ 2. Basic Terraform Resource Example

From the diagram:

```hcl
resource "azurerm_resource_group" "dhondhu" {
  name     = "rg-humana"
  location = "westeurope"
}
```

### 🔍 Breakdown:

* `resource` → Block keyword
* `"azurerm_resource_group"` → Resource type
* `"dhondhu"` → Logical name (internal reference)
* `name` → Actual Azure resource name
* `location` → Region

👉 This is a **hardcoded approach**

---

# 🔁 3. Variables in Terraform

## 📌 3.1 Declaration

```hcl
variable "rg_name" {}
```

👉 This creates an input variable

---

## 📌 3.2 Usage

```hcl
var.rg_name
```

👉 Used inside resource blocks

---

## 📌 3.3 Why Variables?

* Avoid hardcoding
* Make reusable configs
* Environment-based deployments (dev/beta/prod)

---

# ⚙️ 4. Ways to Assign Variables

Diagram clearly shows **6 methods** :

---

## 1️⃣ CLI Method

```bash
terraform plan -var 'rg_name=rg-sangeeta'
```

👉 Quick override

---

## 2️⃣ Multiple -var

```bash
terraform plan \
-var 'rg_name=rg1' \
-var 'rg_location=westus'
```

---

## 3️⃣ -var-file

```bash
terraform plan -var-file="dev.tfvars"
```

👉 Load from file

---

## 4️⃣ terraform.tfvars (Default file)

* Automatically picked by Terraform
* No need to pass explicitly

---

## 5️⃣ .auto.tfvars

👉 Important concept from diagram:

> “auto.tfvars = terraform.tfvars ke chote tukde”

Meaning:

* Multiple small variable files
* Automatically loaded

---

## 6️⃣ Default Values

```hcl
variable "rg_name" {
  default = "rg-default"
}
```

👉 Lowest priority

---

# 📊 5. Variable Types (Very Important)

## 🧵 1. String

* Always in **double quotes**

```hcl
name = "Kajal"
```

---

## 🔢 2. Number

* No quotes

```hcl
age = 67
```

---

## ✅ 3. Boolean

```hcl
is_intelligent = true
```

---

## 📦 4. List (Collection)

👉 **Always square brackets [ ]**

```hcl
fruits = ["apple", "mango", "banana"]
marks  = [99, 86, 69]
```

💡 Tip:

> “List = chokor dabba [ ] yaad rakho”

---

## 🗺️ 5. Map (Key-Value)

👉 **Always curly braces { }**

```hcl
india = {
  "Madhya Pradesh" = "Bhopal"
  "Rajasthan"      = "Jaipur"
}
```

💡 Tip:

> “Map = curly braces { } yaad rakho”

---

## 🔄 Mixed Examples (from diagram)

```hcl
number        = 56.4
boolean       = true
list_number   = [34, 54, 23]
list_boolean  = [true, false]
list_string   = ["kallu", "ballu"]
```

---

# 🔁 6. From Hardcoding → Dynamic Infra

## ❌ Hardcoded

```hcl
name = "rg-humana"
```

## ✅ Using Variables

```hcl
name = var.rg_name
```

👉 This makes infra reusable

---

# 🔄 7. Looping Concept (Advanced + Important)

Diagram bottom explains:

## 🔹 Problem:

> “Block ko baar baar copy karne ka dard”

👉 Repetition problem

---

## 🔹 Solution: Looping

### ✅ for_each + list

👉 Create multiple RGs in **same region**

```hcl
for_each = ["rg1", "rg2", "rg3"]
```

---

### ✅ for_each + map

👉 Create RGs in **different regions**

```hcl
for_each = {
  rg1 = "eastus"
  rg2 = "westus"
}
```

---

# 🧠 Final DevOps Insights (Important for Interview)

### 🔥 Key Takeaways:

* Terraform = **Declarative IaC**
* Variables = **Reusability**
* tfvars = **Environment separation**
* for_each = **Scalability**
* CLI vs tfvars = **Flexibility**

---

# 🚀 Real-World Mapping (Your Use Case)

Since you work on:

* AKS
* Multi-env (dev/beta/prod)
* Terraform pipelines

👉 This diagram directly maps to:

| Concept   | Real Usage              |
| --------- | ----------------------- |
| Variables | Different env configs   |
| tfvars    | dev.tfvars, prod.tfvars |
| for_each  | Multiple RG / clusters  |
| CLI       | CI/CD overrides         |
| Map       | Region-based infra      |

---

# ⚡ One-Line Summary

👉 **Terraform Variables + Loops = Reusable, Scalable, Production-Ready Infrastructure**

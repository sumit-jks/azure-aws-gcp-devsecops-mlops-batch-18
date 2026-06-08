# 📘 **Batch 18 – Terraform + DevOps Learning Notes**

## 🔹 **Session & Timeline Overview**

### 📅 Upcoming Sessions

* **Monday (9:30 PM):** Google Classroom session with Atul Sir
* **Tuesday (9:30 PM):** New Subscription Onboarding
* **15–17 April:** Resume Preparation Classes
* **From 1 May:** Interview Process Starts

### 🎯 Key Preparation Goals

* Prepare **self-introduction before interviews**
* Prepare **project use cases**
* Focus on:

  * Terraform Pipelines
  * Azure
  * Git

---

## 🔹 **1-Month Action Plan**

* 📺 **Screen sharing karke padhana hai** (teach others)
* 💼 Build strong **LinkedIn presence**
* 🧠 Practice diagrams using **Draw.io**

---

## 🔹 **Prerequisites (Must Have Setup)**

Before starting Terraform:

* ✅ Terraform installed
* ✅ Provider installed
* ✅ VS Code + Extensions
* ✅ Azure CLI installed
* ✅ Azure Subscription with Contributor access

---

# 🧠 **Core Terraform Concepts (Very Important)**

---

## 🔹 **Basic Folder Structure**

```
Project Folder
 └── rg.tf   (Terraform file)
```

Inside `.tf` file:

* Provider block
* Resource definitions

---

## 🔹 **Terraform Components**

### 1. **Terraform Code (.tf files)**

* This is your **source of truth**
* Written by user

👉 **"Code hi Satya hai"**

---

### 2. **Terraform State File (.tfstate)**

* Stores current infrastructure state
* Works like **Terraform ka “Dimag” (memory)**

---

### 3. **Azure Portal (Real Infrastructure)**

* Actual resources live here

---

## 🔹 **Terraform Workflow**

### 🧾 Step 1: `terraform plan`

* Reads `.tf` files
* Compares:

  * Code (desired state)
  * State file (current state)

👉 Shows **what will change**

---

### 🚀 Step 2: `terraform apply`

* Executes the plan
* Creates/updates infrastructure

👉 First apply → **creates state file**

---

# 🛒 **Real-Life Analogy (Shopping Example)**

| Concept      | Real Life Example |
| ------------ | ----------------- |
| `.tf code`   | Shopping List     |
| `.tfstate`   | Dimag (memory)    |
| Azure Portal | Shopping Bag      |

👉 **List hi Satya hai (Code is truth)**

---

## 🔹 **Terraform Scenarios Explained**

---

### ✅ **Scenario 1: New Resource Added**

📌 If you add something in `.tf file`:

* Terraform will:

  1. Create resource in Azure
  2. Update state file

---

### ❌ **Scenario 2: Resource Removed from Code**

📌 If something is removed from `.tf file`:

* Terraform will:

  * **Delete that resource from Azure**

👉 Because:

> Code is truth → if not in code → should not exist

---

### 🔄 **Scenario 3: Resource Deleted Manually from Azure**

📌 If resource is deleted from Azure Portal:

* Terraform will:

  * **Recreate it on next apply**

👉 Because:

> Code says it should exist

---

### 🔁 **Scenario 4: Resource Modified Manually**

📌 If resource name/config is changed manually:

* Terraform will:

  * Detect drift
  * Revert or recreate based on code

---

# ⚙️ **Important Terraform Logic**

1. Terraform searches `.tf files`
2. Finds **resource blocks**
3. Compares:

   * Code vs State
4. Decides:

   * Create / Update / Delete

---

# 🧑‍🏫 **Teaching Requirement (Very Important)**

👉 You must:

* Teach in **Siksha Sathi group**
* Do **screen sharing**
* Even if alone → still teach

---

# 📝 **Homework (HW)**

(Not explicitly defined, but implied tasks:)

* Practice Terraform basics
* Create Resource Groups via code
* Understand Plan vs Apply
* Teach others via screen share

---

# 🔥 **Key Takeaways**

* ✅ **Code is always the source of truth**
* ✅ Terraform maintains consistency between:

  * Code
  * State
  * Real Infrastructure
* ✅ Never rely on manual changes in Azure
* ✅ Always use Terraform for changes

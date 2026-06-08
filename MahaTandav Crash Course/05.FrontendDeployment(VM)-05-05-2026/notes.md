# 📘 Comprehensive Notes on Diagram (DevOps + Azure + Terraform + Deployment)

---

# 1. 🎯 Overview of the Diagram

The diagram represents a **complete DevOps workflow** involving:

* Azure Cloud Infrastructure
* Terraform (Infrastructure as Code)
* CI/CD Pipeline
* Web Application Deployment using Nginx
* Basic system design discussion (HLD & LLD)

👉 It simulates a **real-world DevOps interview/use-case scenario**

---

# 2. 🧑‍💻 Mock Interview Context

### Guidelines Mentioned

* Start with **Introduction (3–4 lines)**
* Explain:

  * Use Case
  * HLD (High-Level Design)
  * LLD (Low-Level Design)
* Show **Implementation approach**

---

### Pricing Context (Mock Practice)

* Market Rate: ₹500 per mock interview
* DevOps Insiders Price: ₹0
* Learning-focused environment (no judgment)

👉 Encourages **practice + hands-on explanation skills**

---

# 3. 🏗️ Use Case (What System Are We Building?)

A simple **web application deployment system** where:

* Code is written and stored in Git
* Infrastructure is created using Terraform
* Deployment is automated using a pipeline
* Application is served via Nginx on an Azure VM

---

# 4. ☁️ Azure Infrastructure Design

## Virtual Network Setup

* **VNet:** `dlink`

  * Address space: `10.143.0.0/16`

* **Subnet:** `netflix-subnet`

  * Range: `10.143.0.0/24`

👉 Ensures network isolation and segmentation

---

## Virtual Machine Configuration

* OS: Ubuntu
* Resource Group: `rg-dev`
* User: `devopsadmin`
* Home directory:

  ```
  /home/devopsadmin
  ```

---

## IP Addressing

* Private IP: `10.143.0.4`
* Public IP: `4.204.224.131`

👉 Public IP allows external access
👉 Private IP used internally

---

# 5. 🌐 Web Server Setup (Nginx)

## Installation

```bash
sudo apt update
sudo apt install nginx
```

---

## Deployment Directory

```
/var/www/html
```

* Stores:

  * HTML
  * CSS
  * JavaScript

👉 Nginx serves static files from this location

---

## Application Size

* Approx: **5 MB**

👉 Indicates lightweight static frontend app

---

# 6. 📦 Build & Artifact Management

## Build Folder

* Contains compiled/generated files after build

## Artifacts

* Final deployable output of application
* Includes:

  * HTML
  * CSS
  * JS

👉 Artifacts are what get deployed to the server

---

# 7. 🔁 CI/CD Pipeline Flow

## Step-by-Step Flow

### 1. Code Stage

* Developer writes code
* Pushes to Git repository

---

### 2. Build Stage

* Application is built
* Output stored in:

  * Build folder
  * Artifacts generated

---

### 3. Infrastructure Stage

* Terraform used to:

  * Create VNet
  * Create Subnet
  * Create VM

---

### 4. Deploy Stage

* Artifacts copied to VM:

  ```
  cp (HTML, CSS, JS) → /var/www/html
  ```

---

### 5. Serve Stage

* Nginx serves application
* Accessible via:

  ```
  http://4.204.224.131
  ```

---

# 8. 🧰 Terraform (Infrastructure as Code)

## Key Concept

* Infrastructure is defined using code

---

## Files

* `provider.tf` (Azure provider config)

---

## Commands

```bash
terraform init
```

### What Happens

* `.terraform` folder created
* Azure provider plugin downloaded

---

## Benefits

* Repeatable infrastructure
* Version-controlled
* Automated provisioning

---

# 9. 🏛️ System Design Concepts

## High-Level Design (HLD)

Focus on:

* Components:

  * Azure VM
  * Nginx
  * Pipeline
* Flow:

  * User → Public IP → Nginx → Web App

---

## Low-Level Design (LLD)

Focus on:

* Exact configurations:

  * IP ranges
  * File paths
  * Commands
  * Deployment steps

---

# 10. 🔐 Access & File Management

## User

* `devopsadmin`

## File Copy Example

```bash
cp <files> /var/www/html
```

👉 Moves build artifacts into web server directory

---

# 11. 🌍 End-to-End Workflow

1. Developer writes code
2. Pushes to Git
3. Pipeline triggers
4. Terraform creates infrastructure
5. Build generates artifacts
6. Artifacts copied to VM
7. Nginx serves application
8. User accesses via browser

---

# 12. 🧠 Key Concepts to Remember

## DevOps

* CI/CD pipeline
* Build vs Deploy
* Artifact management

---

## Cloud

* Virtual Network
* Subnetting
* Public vs Private IP

---

## Web Hosting

* Nginx static hosting
* `/var/www/html` usage

---

## Terraform

* `terraform init`
* Provider setup
* Infrastructure automation

---

# 13. 🎤 Interview-Focused Points

Be ready to answer:

* Difference between HLD & LLD
* What are artifacts?
* Why use Terraform?
* How Nginx works?
* What happens in pipeline stages?
* Public vs Private IP difference

---

# 14. 💡 Final Summary

👉 This diagram represents a **basic DevOps project lifecycle**:

* Infrastructure provisioning (Terraform)
* Application build (Node/npm)
* Deployment (CI/CD pipeline)
* Hosting (Nginx on Azure VM)

👉 It is a **beginner-to-intermediate level real-world deployment architecture**
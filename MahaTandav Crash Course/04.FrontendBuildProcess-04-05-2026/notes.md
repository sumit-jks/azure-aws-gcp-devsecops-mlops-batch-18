# 📘 Comprehensive Notes on the Diagram

## 1. 🌐 Cloud Infrastructure Setup (Azure)

### Virtual Network Configuration

* **Virtual Network (VNet):** `dlink`

  * Address space: `10.143.0.0/16`
* **Subnet:** `netflix-subnet`

  * Address range: `10.143.0.0/24`

👉 This setup isolates resources within a private network and allows controlled communication.

---

### Virtual Machine (VM) Details

* **OS:** Ubuntu
* **Private IP:** `10.143.0.4`
* **Public IP:** `4.204.224.131`
* **Resource Group:** `rg-dev`

👉 Public IP allows external access; private IP is used within the network.

---

### VM Access

* SSH command:

  ```
  ssh <username>@<public-ip>
  ```

---

## 2. ⚙️ Server Setup (Nginx Web Server)

### Installation Steps

```bash
sudo apt update
sudo apt install nginx
```

### Application Deployment

* Web files are placed in:

  ```
  /var/www/html
  ```
* Contains:

  * HTML
  * CSS
  * JavaScript

👉 Nginx serves static files from this directory.

---

## 3. 🌍 Web Application Architecture

### Frontend Basics

* Browser runs:

  * HTML → Structure
  * CSS → Styling
  * JS → Interactivity

👉 Browser is the runtime environment for frontend code.

---

### UI Components

* Buttons
* Textboxes
* Forms

These are built using modern frameworks.

---

### Frontend Frameworks Mentioned

* React
* Angular
* Next.js

---

### React Workflow

* Uses `.jsx` files
* JSX → Converted into:

  * HTML
  * CSS
  * JavaScript

👉 Requires build tools (Node.js ecosystem)

---

## 4. 🧰 Development Environment Setup

### Required Tools

* **Node.js**
* **npm (Node Package Manager)**

---

### Project Setup Steps

1. Clone code repository

2. Important files:

   * `README.md`
   * `package.json`
   * `provider.tf`

3. Install dependencies:

   ```bash
   npm install
   ```

---

## 5. 🚀 DevOps / Deployment Pipeline

### Stages

#### 1. Build Stage

* Converts source code into deployable format
* Example:

  * React → static files

---

#### 2. Deploy Stage

* Files copied to:

  ```
  /var/www/html
  ```
* Served via Nginx

---

## 6. 🏗️ Infrastructure as Code (Terraform)

### Terraform Components

* File: `provider.tf`
* Provider: `azurerm v4.0.0`

---

### Commands

```bash
terraform init
```

### What Happens:

* `.terraform` folder created
* Azure provider plugin downloaded (`azurerm.exe`)

---

## 7. 📡 Networking + Deployment Flow

### End-to-End Flow

1. User accesses:

   ```
   http://4.204.224.131
   ```
2. Request hits:

   * Azure VM (Ubuntu)
3. Nginx handles request
4. Static files served from:

   ```
   /var/www/html
   ```
5. Browser renders:

   * HTML + CSS + JS

---

## 8. 🧠 Key Concepts Summary

### Cloud Concepts

* Virtual Network (VNet)
* Subnetting
* Public vs Private IP

---

### DevOps Concepts

* Build vs Deploy stages
* Infrastructure as Code (Terraform)
* CI/CD basics

---

### Web Concepts

* Frontend frameworks
* Static hosting via Nginx
* Browser rendering

---

## 9. 🔁 Overall Workflow (Simplified)

1. Create Azure resources (VNet, VM)
2. SSH into VM
3. Install Nginx
4. Build frontend app
5. Copy files to `/var/www/html`
6. Access via public IP

---

## 10. 💡 Important Observations

* The architecture is **simple static hosting**
* No backend/API layer shown
* Focus is on:

  * Deployment
  * Networking
  * Frontend delivery

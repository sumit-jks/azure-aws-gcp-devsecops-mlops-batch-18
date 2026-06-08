# Azure Networking & Landing Zone Notes

## Landing Zone Pillars

When someone asks in an interview: *“Have you designed architecture?”*
These are the important pillars to discuss:

1. Hierarchy
2. Governance & Compliance
3. IAM (Identity and Access Management)
4. Networking
5. Compute
6. Backup & Disaster Recovery
7. Monitoring
8. Security
9. Cost Optimization

---

# Networking Basics

## What is a Network?

If two computers are on the same network, they can communicate with each other.

Example:

* Computer A → 10.0.0.1
* Computer B → 10.0.0.2

Both are inside the same network, so communication is possible.

---

# Router

A router connects devices and helps communication happen between networks.

Example:

* India Router
* USA Router

Routers forward traffic from one network to another.

---

# IP Address

Every device connected to a network gets an IP address.

Example:

* 10.0.0.1
* 10.0.0.2
* 10.0.0.3

---

# CIDR Notation

CIDR format:

10.0.0.0/24

* `/24` means 24 bits are reserved for network portion.
* Bigger number after `/` = Smaller network size.
* Smaller number after `/` = Larger network size.

Examples:

| CIDR | Approx IPs         |
| ---- | ------------------ |
| /24  | 256 IPs            |
| /16  | 65,536 IPs         |
| /8   | Very large network |

---

# Internet CIDR

Entire internet:

0.0.0.0/0

* Represents all IP addresses on internet.
* Total IPv4 addresses:

2^{32}=4,294,967,296

Around 429 crore IP addresses.

---

# Public vs Private Network

## Public Network

* Connected to internet
* Accessible publicly

Example:

* Google.com

---

## Private Network

Used for:

* Security
* Internal communication

Private IP ranges:

10.0.0.0/8

192.168.0.0/16

---

# Virtual Network (VNet)

Azure Virtual Network acts like your private network in cloud.

Example:

* VNet CIDR → `10.0.0.0/16`

Inside VNet we create subnets.

---

# Subnets

Example architecture:

| Subnet          | CIDR        |
| --------------- | ----------- |
| Frontend Subnet | 10.0.1.0/24 |
| Backend Subnet  | 10.0.2.0/24 |
| Database Subnet | 10.0.3.0/24 |

Purpose:

* Separate workloads
* Better security
* Better management

---

# Department Example

Company departments can have separate subnets:

| Department | Subnet      |
| ---------- | ----------- |
| HR         | 10.0.1.0/24 |
| Accounts   | 10.0.2.0/24 |

---

# VNet Peering

Used to connect two VNets.

## Same Region

* Use VNet Peering

## Different Region

* Use Global VNet Peering

---

# Site-to-Site Connection

Connects:

* Office network ↔ Cloud network

Uses:

* VPN Gateway

---

# Point-to-Site Connection

Used when:

* Individual user/device connects securely to cloud.

Example:

* Employee laptop connecting to Azure.

---

# ExpressRoute

Dedicated private connection using physical cables.

Benefits:

* High speed
* Low latency
* More secure than internet VPN

---

# Public IP Example

Example Public IP:

* 56.65.98.54

Public IP is reachable from internet.

---

# VM Networking

A VM is just a virtual machine box.

To communicate over network:

* Attach NIC (Network Interface Card)

Without NIC:

* VM cannot communicate.

---

# CIDR Planning in Cloud

Before choosing CIDR range, check:

1. Existing Network Inventory
2. Overlap Analysis
3. Connectivity Requirements

   * Site-to-Site
   * ExpressRoute
4. Number of workloads
5. Future IP growth

---

# Important Interview Points

## Why subnetting?

* Security isolation
* Better traffic management
* Separate workloads

## Why private IPs?

* Internal secure communication
* Saves public IP usage

## Why VNet?

* Creates isolated cloud network

## Why peering?

* Connect VNets privately

---

# Key Lines for Interviews

* “Landing zone includes governance, IAM, networking, monitoring, security, DR, and cost optimization.”
* “CIDR planning is important to avoid IP overlap.”
* “Subnets help isolate frontend, backend, and database workloads.”
* “Private networks improve security.”
* “VNet peering connects VNets privately without internet.”

# 🐾 Animal Rescue Reporting and Management System

![Java](https://img.shields.io/badge/Java-Servlets-orange?style=flat-square&logo=java)
![JSP](https://img.shields.io/badge/Frontend-JSP%20%7C%20Bootstrap%205-blue?style=flat-square)
![MySQL](https://img.shields.io/badge/Database-MySQL%208-lightgrey?style=flat-square&logo=mysql)
![Tomcat](https://img.shields.io/badge/Server-Apache%20Tomcat%2010-green?style=flat-square&logo=apachetomcat)

A responsive, lightweight web application designed to bridge the gap between citizens who spot animals in distress and the rescue organizations capable of helping them. Built completely using **Core Java (Servlets & JSP)** to maintain a simple, transparent, and robust architecture without relying on heavy backend frameworks.

---

## ✨ Features

### 👤 For General Public (Reporters)
*   **Quick Reporting:** Submit rescue requests with location, animal type, description, and urgency levels.
*   **Photo Upload:** Upload images of the animal in distress to assist rescuers.
*   **Status Tracking:** Track the progress of reported rescue cases.

### 🛡️ For Administrators
*   **Central Dashboard:** View, filter, and manage all incoming rescue reports.
*   **Volunteer Assignment:** Assign available rescue workers to specific cases instantly.
*   **Status Management:** Update report milestones from *Pending* to *In Progress* and *Resolved*.

### ⛑️ For Volunteers
*   **Dedicated Cases View:** View assigned rescues along with full incident descriptions and mapping details.
*   **Availability Toggling:** Easily switch status between *Available* and *On Mission*.

---

## 🛠️ Tech Stack

*   **Backend:** Pure Java Servlets (HTTP handling & core logic)
*   **Frontend Layer:** JSP (JavaServer Pages), JSTL, HTML5, CSS3, Bootstrap 5
*   **Database:** MySQL 8 (Communicating via pure JDBC)
*   **Server:** Apache Tomcat 10
*   **Build Tool:** Maven
*   **Security:** BCrypt Password Hashing (`jBCrypt`)

---

## 🚀 Getting Started (Local Setup)

### Prerequisites
*   **JDK 17** or higher
*   **Apache Tomcat 10**
*   **MySQL 8.0**
*   **Maven**

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/animal-rescue-system.git
   cd animal-rescue-system

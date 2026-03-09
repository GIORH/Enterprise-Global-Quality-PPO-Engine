# 🚀 Enterprise Global Quality PPO Engine
### Next-Gen Quality Assurance Framework | Google Apps Script & Business Intelligence

This repository houses a comprehensive, multi-layered Quality Assurance ecosystem designed to automate, track, and analyze performance across global operations. Built with **Google Apps Script**, **Bootstrap 5**, and **Chart.js**, it provides a role-based experience from the Frontline Analyst to Global Directors.

---

## 🏗️ System Architecture & Data Flow

The engine operates on a 5-tier hierarchical model, ensuring data integrity and specialized visibility at every level:



1.  **Analyst Layer (Data Entry):** Dynamic forms with real-time WDID validation via Roster lookup.
2.  **Team Lead Layer (Governance):** Master controller for team approvals, bulk processing, and performance tracking.
3.  **Managerial Layer (Insights):** Strategic dashboards focusing on program-level health and regional benchmarks.
4.  **Regional Lead Layer (Standardization):** High-performance grids to monitor cross-site variance and calibration alignment.
5.  **Director Layer (Executive Strategy):** Dark-mode ROI dashboards for global oversight and risk management.

---

## 🛠️ Technical Tech Stack

* **Backend:** Google Apps Script (JavaScript V8 Engine).
* **Frontend:** HTML5, CSS3, Bootstrap 5.
* **Data Visualization:** Chart.js, Tabulator.js, DataTables.
* **Data Source:** Google Sheets (Relational-style modeling with cross-sheet Lookups).
* **Security:** Role-Based Access Control (RBAC) via Workday ID (WDID) validation.

---

## 📂 Project Structure

```text
src/
├── backend/
│   ├── KPI_Logging_Engine.gs             # Analyst Form Logic
│   ├── Quality_TL_Master_Controller.gs   # TL Approval Engine
│   ├── Executive_Strategy_Controller.gs  # Managerial Aggregation
│   └── Global_Director_Analytics.gs      # Executive Projections
└── frontend/
    ├── UI.html                           # Entry Form
    ├── TL_Dashboard_UI.html              # Team Management
    ├── Regional_Governance_UI.html       # Regional Grid
    └── Director_Strategy_Board.html      # Dark-mode Strategy Board

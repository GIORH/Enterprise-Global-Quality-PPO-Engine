# 🌐 Enterprise Global Quality PPO Engine (BigQuery + Apps Script)

## 🚀 Project Overview
This repository contains the end-to-end data infrastructure designed to manage and calculate **PPOs (Performance Payment Objectives)** for the Global Quality Department at **TELUS Digital**. 

The system automates the entire lifecycle of performance data: from dynamic intake form generation to complex multi-source consolidation in **Google BigQuery**, and finally, a dimensional layer optimized for **Looker Studio** executive dashboards.

---

## 🏗️ Data Architecture & Pipeline Stages

The project follows a modular **Medallion Architecture** (Raw > Silver > Gold) to ensure data integrity and scalability:



### 1. 📥 Layer 01: Ingestion (Raw)
* **Source:** 7 heterogeneous data sources (VOC, Quality, Team Dev, PPD, Productivity, Accuracy, and Targets Master).
* **Automation:** Google Apps Scripts dynamically generate role-specific intake forms, pushing data directly into a centralized Metric Hub.

### 2. ⚡ Layer 02: Normalization (Silver)
* **Process:** Stored Procedures (SQL) perform deep cleaning and type casting.
* **Logic:** Implementation of `FULL OUTER JOIN` strategies to consolidate all sources without data loss.
* **Dynamic Weighting:** Metrics are weighted based on a `targets_master` table that adjusts goals according to the employee's role and effective date.

### 3. 📉 Layer 03: Dimensional Modeling (Gold - Unpivot)
* **Optimization:** A dedicated SQL layer transforms "wide" consolidated tables into "long" (unpivoted) formats.
* **Purpose:** Specifically engineered for **Looker Studio** to allow dynamic filtering, time-series analysis, and cross-metric comparisons.

### 4. 📊 Layer 04: Executive Reporting
* **Outputs:** Automated Scorecards, Overall Summaries, and an Executive Dashboard for global leadership.

---

## 📂 Repository Structure

```text
├── sql-queries/
│   ├── quality-analyst/         # Quality Analyst Role (Entry Level)
│   │   ├── 01-raw-ingestion/    # Schema definitions for raw tables
│   │   ├── 02-normalization/    # ETL Stored Procedures (Consolidation)
│   │   ├── 03-unpivot-layer/    # BI-ready views (Unpivot logic)
│   │   └── 04-final-reporting/  # Executive Summary queries
│   ├── quality-specialist/      # (Upcoming) Specialist Role logic
│   └── quality-manager/         # (Upcoming) Management Role logic
├── apps-script/                 # Automation code for Intake Forms
├── docs/                        # System Architecture & Data Dictionary
└── README.md
Global-Quality-PPO-Engine/
├── sql-scripts/             # Complex BigQuery Queries by Role
├── apps-script/             # Automation code for Form Generation & Routing
├── documentation/           # Logic diagrams and PPO eligibility rules
└── tests/                   # Data validation & quality assurance scripts

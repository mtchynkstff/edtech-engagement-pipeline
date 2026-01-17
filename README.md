# 📊 EdTech Engagement Pipeline
**An end-to-end analytics engineering & product analytics project using dbt, DuckDB, Python, and Jupyter**

---

## 🚀 Project Overview

This project builds a **modern, reproducible analytics pipeline** for the *LearnPlatform COVID-19 Digital Engagement Dataset*.

Raw CSV data is transformed into a clean DuckDB warehouse using **dbt**, then analyzed through **Jupyter notebooks** to surface product-level engagement patterns in EdTech usage during COVID-era disruptions.

The project intentionally balances **analytics engineering rigor** with **exploratory and decision-oriented analysis**, mirroring how data teams support product, curriculum, and implementation stakeholders.

Rather than treating engagement as an outcome, the analysis focuses on how engagement patterns can inform **product prioritization and implementation decisions** under real-world data constraints.

---

## 🏗️ Architecture

```
Raw CSVs
  → DuckDB Warehouse
    → dbt Staging Models
      → dbt Fact & Dimension Marts
        → Jupyter Notebooks
          → Product & Engagement Insights
```

---

## 📂 Repository Structure

```text
edtech-engagement-pipeline/
├── data/                     # Raw CSV inputs
├── warehouse/                # DuckDB database file
├── edtech_dbt/
│   ├── models/
│   │   ├── staging/           # Cleaned, typed source models
│   │   └── marts/             # Fact & dimension tables
│   ├── analyses/
│   ├── seeds/
│   └── .dbt/
├── notebooks/                 # EDA & product analysis notebooks
├── src/
├── Makefile
└── README.md
```

---

## 🔧 Data Pipeline Summary

### dbt Staging Models
- **stg_districts** – district metadata with standardized types
- **stg_products** – product reference data
- **stg_engagement** – cleaned daily engagement records

### dbt Mart Models
- **fct_product_daily_engagement**  
  Product × day grain fact table containing averaged engagement metrics

- **fct_daily_engagement_unknown_product**  
  Daily rollups of engagement rows where `lp_id` is missing (QA / coverage analysis)

- **dim_products**  
  Coverage-first product dimension

All models include schema and data tests to ensure correctness.

---

## 📊 Analysis Notebooks

The notebooks are designed to be **readable on GitHub** and focus on *interpretation*, not just charts.

Each notebook is scoped to answer a specific set of questions and intentionally balances exploratory analysis with actionable interpretation.

- **01_engagement_eda.ipynb**
  - Data coverage & quality checks
  - Engagement distribution analysis
  - Time-based trends
  - Product-level volatility analysis

- **02_product_analysis.ipynb**
  - Engagement concentration (Pareto-style analysis)
  - Stable vs volatile product behavior
  - Product usage patterns over time
  - Framing insights for product and instructional decisions

---

## 🧪 How to Run Locally

```bash
pip install dbt-duckdb
cd edtech_dbt
dbt seed --profiles-dir .dbt --target ci
dbt build --profiles-dir .dbt --target ci
```

Then open and run the notebooks from the `notebooks/` directory.

---

## 🔁 CI

GitHub Actions runs seeded dbt builds to validate:
- Model correctness
- Schema tests
- Reproducibility of the analytics warehouse

---

## 🎯 Key Takeaway

This project demonstrates how **engagement data can be responsibly analyzed** to understand product adoption patterns—highlighting the difference between *sporadic usage* and *sustained instructional integration* in EdTech platforms.

# 📊 EdTech Engagement Pipeline
**An end-to-end analytics engineering & analytics project using dbt, DuckDB, Python, and Jupyter**

---

## 🚀 Project Overview

This project builds a **modern analytics pipeline** for the *LearnPlatform COVID-19 Digital Engagement Dataset*, transforming raw CSVs into a clean, queryable analytics warehouse and performing meaningful analysis on digital learning engagement during the COVID-19 disruptions.

Built using **Python (pandas), DuckDB, dbt, and Jupyter**, the pipeline demonstrates:

- A reproducible local analytics warehouse
- Clean, testable transformations using dbt
- Explicit handling of incomplete and messy real-world data
- Exploratory and analytical outputs aligned to EdTech business questions

---

## 🏗️ Architecture

Raw Data → DuckDB Warehouse → dbt Staging → dbt Marts → Analyses / Notebooks → Insights

---

## 📂 Repository Structure

```text
edtech-engagement-pipeline/
├── data/
├── warehouse/
├── edtech_dbt/
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   ├── analyses/
│   ├── seeds/
│   └── .dbt/
├── notebooks/
├── src/
├── Makefile
└── README.md

---

## 🔧 Data Pipeline Summary

### dbt Staging
- stg_districts
- stg_products
- stg_engagement

### dbt Marts
- fct_product_daily_engagement (product × day grain)
- fct_daily_engagement_unknown_product (null lp_id rows)
- dim_products (coverage-first dimension)

All models are fully tested with dbt.

---

## 🧪 How to Run Locally

pip install dbt-duckdb  
cd edtech_dbt  
dbt seed --profiles-dir .dbt --target ci  
dbt build --profiles-dir .dbt --target ci  

---

## 🔁 CI

GitHub Actions runs seeded dbt builds to ensure reproducibility.

---

## 📘 Notebooks

- 01_engagement_eda.ipynb
- 02_product_analysis.ipynb

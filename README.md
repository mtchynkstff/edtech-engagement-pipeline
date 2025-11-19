# 📊 EdTech Engagement Analytics Pipeline  
### Modern data pipeline using Python, DuckDB, dbt, and the LearnPlatform COVID-19 Digital Learning Dataset

[![dbt](https://img.shields.io/badge/dbt-%23FF694B.svg?style=for-the-badge&logo=dbt&logoColor=white)]()
[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg?style=for-the-badge&logo=python&logoColor=white)]()
[![DuckDB](https://img.shields.io/badge/DuckDB-Analytics%20DB-yellow.svg?style=for-the-badge)]()
[![Status](https://img.shields.io/badge/Status-In%20Progress-brightgreen.svg?style=for-the-badge)]()

## Project Overview

This project builds a start-to-finish modern data analytics pipeline for analyzing K–12 digital learning engagement using the LearnPlatform COVID-19 Impact on Digital Learning dataset.

The goal is to showcase real-world skills in ETL/ELT engineering, warehousing, analytics engineering, dimensional modeling, and data testing.

## Architectural Diagram

```
                 +---------------------------+
                 |   LearnPlatform Dataset   |
                 +-------------+-------------+
                               |
                               v
                 | Python ETL (pandas + duckdb) |
                               v
                 +---------------------------+
                 |     DuckDB Warehouse      |
                 +-------------+-------------+
                               |
                               v
                 |           dbt             |
                               v
                 +---------------------------+
                 |     Analytics Layer       |
                 +-------------+-------------+
                               |
                               v
                 |   BI / Dashboard Outputs |
```

## Repository Structure

```
edtech-engagement-pipeline/
├── data/
│   └── raw/
│       ├── engagement_data/
│       ├── districts_info.csv
│       └── products_info.csv
├── warehouse/
│   └── edtech_engagement.duckdb
├── src/
│   └── etl/
│       └── load_learnplatform_to_duckdb.py
├── notebooks/
│   └── exploratory_data_analysis.ipynb
└── edtech_dbt/
    ├── dbt_project.yml
    └── models/
        └── staging/
            ├── stg_engagement.sql
            ├── stg_districts.sql
            ├── stg_products.sql
            └── schema.yml
```

## Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/<your-username>/edtech-engagement-pipeline.git
cd edtech-engagement-pipeline
```

### 2. Create a virtual environment
```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 3. Install dependencies
```bash
pip install duckdb pandas dbt-core dbt-duckdb
```

### 4. Load the raw dataset into DuckDB
```bash
python src/etl/load_learnplatform_to_duckdb.py
```

### 5. Run dbt
```bash
cd edtech_dbt
dbt run
dbt test
```

## Example Queries

```sql
SELECT lp_id,
       AVG(engagement_index) AS avg_engagement
FROM analytics.stg_engagement
GROUP BY 1
ORDER BY avg_engagement DESC
LIMIT 10;
```

## Next Steps

- Build marts: fct_daily_engagement, dim_products, district_summary  
- Add documentation and exposures  
- Build dashboard outputs  
- Add visual EDA notebook  

## Data Quality Considerations

- Some daily engagement rows are missing a product id (lp_id). This likely reflects incomplete product mapping in the source data.

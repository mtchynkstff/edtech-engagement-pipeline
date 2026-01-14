# EdTech Engagement Analytics Pipeline

This project demonstrates an **end-to-end analytics engineering pipeline** built with **dbt + DuckDB**, using real-world edtech engagement data. It focuses on **data modeling, testing, documentation, and CI**, with intentional handling of incomplete and messy source data.

## What This Project Demonstrates

- **Analytics engineering fundamentals**
  - Clear staging → marts layer separation
  - Explicit grain definitions
  - Coverage-first dimensional modeling

- **Data quality & testing**
  - Primary key and uniqueness tests
  - Relationship tests between facts and dimensions
  - Explicit modeling of unmapped entities (rather than silently dropping them)

- **Reproducibility & CI**
  - Repo-safe `profiles.yml`
  - Seeded sample data for CI
  - GitHub Actions workflow that runs `dbt seed` + `dbt build`

- **Documentation & consumption**
  - dbt docs with lineage and column-level metadata
  - Example analysis queries built on top of marts

## Data Overview

The dataset represents **daily product-level engagement metrics** from an edtech platform.

### Core raw tables (modeled via seeds in CI)

- `raw_engagement`
- `raw_products`
- `raw_districts`

## Modeling Approach

### Staging Models (`stg_*`)
Explicit column selection, renaming, and type casting.

### Fact Models
- `fct_product_daily_engagement`
- `fct_daily_engagement_unknown_product`

### Dimension Models
- `dim_products` (coverage-first)

## How to Run Locally

```bash
pip install dbt-duckdb
cd edtech_dbt
dbt seed --profiles-dir .dbt --target ci
dbt build --profiles-dir .dbt --target ci
```

## Docs

```bash
dbt docs generate --profiles-dir .dbt
dbt docs serve
```

## Tools Used

- dbt
- DuckDB
- GitHub Actions
- SQL

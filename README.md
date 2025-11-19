# 📊 EdTech Engagement Pipeline  
**An end-to-end analytical data engineering & analytics project using dbt, DuckDB, and Jupyter**

---

## 🚀 Project Overview

This project builds a **modern analytics pipeline** for the *LearnPlatform COVID-19 Digital Engagement Dataset*, transforming raw CSVs into a clean, queryable analytics warehouse and performing meaningful analysis on digital learning engagement during the COVID-19 disruptions.

Built using **Python (pandas), DuckDB, dbt, and Jupyter**, the pipeline demonstrates:

- A scalable local analytics warehouse  
- Clean, testable transformations using dbt  
- Exploratory and visual analysis using Python  
- Insights aligned to real EdTech business questions  

This is the first of three portfolio projects showcasing end-to-end analytics, aligned with my background as a teacher, digital marketer, and EdTech-focused analyst.

---

# 🏗️ Architecture

Raw Data → Local DuckDB Warehouse → dbt Staging Layer → dbt Marts → Analysis Notebooks → Insights

### Tools Used

| Layer            | Tool         | Purpose                                   |
|------------------|--------------|-------------------------------------------|
| Storage          | DuckDB       | Local analytical database                 |
| Transformations  | dbt-core     | Staging, cleaning, modeling, testing      |
| Analysis         | Python, Jupyter | EDA, visuals, metrics                  |
| Version Control  | Git + GitHub | Reproducibility, project tracking         |

---

# 📂 Repository Structure

```text
edtech-engagement-pipeline/
│
├── data/                           # Raw CSVs
├── warehouse/                      # DuckDB database
│   └── edtech_engagement.duckdb
│
├── edtech_dbt/                     # dbt project
│   ├── models/
│   │   ├── staging/                # Clean staging models
│   │   └── marts/                  # Fact + dimension tables
│   └── ...
│
├── notebooks/
│   └── 01_engagement_eda.ipynb     # Exploratory data analysis
│   └── 02_project_analysis.ipynb   # Exploratory product analysis
│
├── src/                            # ETL scripts
└── README.md
```

---

# 🔧 Data Pipeline Summary

### 1️⃣ Raw Data → DuckDB  

The LearnPlatform CSVs are loaded into a fast, analytical DuckDB warehouse (`warehouse/edtech_engagement.duckdb`).

### 2️⃣ dbt Staging Layer  

Standardizes naming, types, and structure for:

- `stg_districts`  
- `stg_products`  
- `stg_engagement`  

### 3️⃣ dbt Marts Layer  

Curated analytical tables:

- `fct_daily_engagement` – daily engagement metrics by product and date  
- (Planned) `dim_products` – product metadata and categorization  

### 4️⃣ Data Quality Tests  

dbt tests validate:

- Uniqueness  
- Non-null fields  
- Data completeness  
- Reasonable row counts  

Most tests pass cleanly; expected warnings occur due to vendor-provided missing `lp_id` values in some engagement rows.

### 5️⃣ Jupyter Analysis  

The notebooks performs EDA using SQL via DuckDB and pandas visualizations.

---

# 📘 01 – Exploratory Data Analysis (EDA)

**Notebook:** `notebooks/01_engagement_eda.ipynb`

### Highlights

- Connects directly to the DuckDB warehouse  
- Verifies table schemas and row counts  
- Explores trends in district-level digital engagement  
- Calculates top products by average engagement index  
- Visualizes:
  - Daily engagement trends over time  
  - Highest-engagement products (by `lp_id`)  
  - Missingness patterns (e.g., null `lp_id`)  
- Identifies data quality considerations and their impact on analysis  

### What This Establishes

- The pipeline is functioning end to end  
- Engagement varies meaningfully over time and across products  
- Product adoption and usage patterns are measurable  
- The dataset can support deeper analytics (e.g., clustering, forecasting, dashboards)

# 📘 02 – Product-Level Engagement Analysis

**Notebook:** `notebooks/02_product_analysis.ipynb`

### Highlights

- Queries DuckDB directly for aggregated product-level metrics
- Ranks products by:
  - Average engagement index
  - Volatility (standard deviation)
  - Days observed
- Includes multiple visualizations:
  - Top products by average engagement
  - Most volatile products
- Provides a clear, honest “future work” section noting that product metadata
(product name, provider) will be incorporated once lp_id is fully wired into stg_products

### What This Adds to the Project

This notebook deepens the analytical backbone of the project by focusing on variation between individual EdTech tools. It’s directly applicable to:

- EdTech product strategy
- Competitive analysis
- Vendor evaluation
- Usage pattern discovery

And it moves the project closer to district segmentation and forecasting work in subsequent notebooks.

---

# 🎯 Key Business Questions This Project Answers

### 1️⃣ How did digital learning engagement change across the COVID-19 disruption?

- Identify spikes, drops, and plateaus in engagement  
- Compare engagement patterns across the time period  
- Understand stability vs. volatility in digital engagement  

### 2️⃣ Which digital tools saw the highest engagement?

- Rank products by average engagement index  
- Compare tools by adoption and engagement levels  
- Identify tools with widespread or niche usage across districts  

### 3️⃣ Which districts show signs of digital inequity?

- Diagnose low-access or low-engagement districts  
- Identify where engagement data is sparse or incomplete  
- Surface patterns that may correlate with equity and resource challenges  

---

# 📊 Current Outputs

- ✅ Raw data loaded into a local DuckDB warehouse  
- ✅ dbt project with staging + fact table (`fct_daily_engagement`)  
- ✅ dbt tests (passing with a documented warning on null `lp_id`)  
- ✅ Exploratory analysis notebook (`01_engagement_eda.ipynb`)  
- ✅ Visual insights into engagement trends and product usage  
- ✅ Version-controlled, reproducible pipeline on GitHub
- ✅ Added second analysis notebook: Product-Level Engagement Analysis
- ✅ Visualizations of top products and volatility
- ✅ Framework for future enrichment using product metadata

---

# 🛣️ Roadmap

### 📘 03 – District Segmentation  

- Cluster districts by engagement patterns, access, and tool usage  
- Identify district archetypes (e.g., high-engagement, low-access, highly volatile)

### 📘 04 – Product Metadata Integration (dbt updates)

- Expose `lp_id` and product attributes in `stg_products` and join them cleanly to the fact table.

### 📊 05 – Dashboard  

- Build an interactive dashboard (Looker Studio / Tableau) using the dbt marts  
- Visualize trends, top tools, and district comparisons for non-technical stakeholders  

### 📚 06 – dbt Docs Site  

- Generate dbt documentation for schema and lineage  
- Provide a browsable catalog of models, sources, and tests  

---

# 🤝 Contact

Questions, collaboration ideas, or feedback are welcome.  
Feel free to open an issue or reach out via GitHub.

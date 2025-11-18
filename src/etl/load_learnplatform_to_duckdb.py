import duckdb
from pathlib import Path

# Base paths
BASE_DIR = Path(__file__).resolve().parents[2]  # project root
RAW_DIR = BASE_DIR / "data" / "raw"
ENGAGEMENT_DIR = RAW_DIR / "engagement_data"
DB_PATH = BASE_DIR / "warehouse" / "edtech_engagement.duckdb"

def main():
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    con = duckdb.connect(str(DB_PATH))

    # Load ALL engagement CSVs into one table
    engagement_pattern = str(ENGAGEMENT_DIR / "*.csv")
    con.execute("""
        CREATE OR REPLACE TABLE raw_engagement AS
        SELECT * FROM read_csv_auto(?, header=True);
    """, [engagement_pattern])

    # Load districts info
    con.execute("""
        CREATE OR REPLACE TABLE raw_districts AS
        SELECT * FROM read_csv_auto(?, header=True);
    """, [str(RAW_DIR / "districts_info.csv")])

    # Load products info
    con.execute("""
        CREATE OR REPLACE TABLE raw_products AS
        SELECT * FROM read_csv_auto(?, header=True);
    """, [str(RAW_DIR / "products_info.csv")])

    print("Loaded data into DuckDB at:", DB_PATH)

    print("\nTables:")
    print(con.execute("SHOW TABLES;").fetchdf())

    print("\nRow counts:")
    for t in ["raw_engagement", "raw_districts", "raw_products"]:
        count = con.execute(f"SELECT COUNT(*) FROM {t}").fetchone()[0]
        print(f"{t}: {count}")

    con.close()

if __name__ == "__main__":
    main()

.PHONY: dbt-build dbt-docs

dbt-build:
	cd edtech_dbt && dbt build

dbt-docs:
	cd edtech_dbt && dbt docs generate

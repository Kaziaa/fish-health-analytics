# Methodology

## Overview

This project used an end-to-end analytical workflow to evaluate salmon-louse monitoring data from Norwegian aquaculture localities.

The workflow combined Python-based preprocessing and feature engineering with PostgreSQL for structured storage and SQL analysis, followed by Grafana for interactive visualization.

## 1. Data Preparation

Raw weekly fish-health data were imported into Python and inspected for:

- missing values
- inconsistent column names
- data types
- regulatory-limit fields
- locality identifiers
- lice-count availability
- sea-temperature availability

Columns were standardized and converted into analysis-ready formats.

## 2. Compliance Analysis

The weekly regulatory lice limit was converted into a numeric field:

`weekly_lice_limit_numeric`

Compliance was represented using:

`compliance_code`

where:

- `0` = valid observation below or at the applicable limit
- `1` = observation above the applicable limit
- `NULL` = compliance could not be evaluated from the available data

The overall breach rate was calculated using only observations with a valid compliance classification.

## 3. Feature Engineering

Temporal and decision-support features were generated at locality level.

These included:

- `adult_female_lice_lag_1`
- `adult_female_lice_lag_2`
- `adult_female_lice_change`
- `adult_female_lice_change_2w`
- `adult_female_lice_mean_3w`
- `distance_to_limit`
- `ratio_to_limit`
- `previous_breach`
- `future_breach`

These variables were designed to capture current lice pressure, recent change, and proximity to the regulatory threshold.

## 4. Temperature Processing

Sea-temperature observations were inspected for missing and implausible values.

The original temperature field was retained and a cleaned analytical variable was generated:

`sea_temperature_clean`

Additional temperature features included:

- previous-week temperature
- weekly temperature change
- 3-week rolling mean temperature

Temperature was then compared with adult female lice levels and future breach status.

## 5. Warning and Risk Analysis

A simple warning rule was developed using:

- proximity to the weekly lice limit
- positive lice growth
- current compliance status

An exploratory risk score was also generated using percentile-ranked indicators of:

- lice pressure
- recent lice growth
- recent temperature

The score was divided into quartiles for comparison of subsequent breach rates.

This score is an exploratory decision-support indicator and should not be interpreted as a validated predictive model.

## 6. Locality Benchmarking

Locality-level summary metrics were calculated, including:

- valid observations
- mean adult female lice
- maximum adult female lice
- breach rate
- warning rate
- mean temperature
- mean ratio to limit
- mean exploratory risk score
- number of high-risk weeks

These metrics were exported to a locality benchmarking dataset.

## 7. PostgreSQL Integration

Processed analytical datasets were imported into PostgreSQL.

The main analytical tables were:

- `weekly_features`
- `locality_benchmark`

SQL was used to validate:

- row counts
- duplicate locality-week combinations
- time ranges
- breach counts
- valid observations
- breach rates

A Grafana-oriented SQL view was also created for locality-level monitoring.

## 8. Grafana Dashboard

Grafana was connected to PostgreSQL through a read-only database user.

The final dashboard included:

- total weekly observations
- total weekly breaches
- valid lice observations
- adult female lice versus weekly limit
- sea-temperature trends
- warning history
- top localities by breach count
- locality benchmarking
- interactive locality selection

## Reproducibility

The repository contains:

- Jupyter notebooks for data preparation and analysis
- processed datasets
- PostgreSQL schema and validation queries
- Grafana dashboard export
- dashboard screenshots
- supporting documentation

This structure allows the analytical workflow to be reviewed and reproduced from preprocessing through visualization.


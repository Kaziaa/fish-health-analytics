CREATE TABLE locality_benchmark (
    locality_id INTEGER PRIMARY KEY,
    locality_name TEXT,
    valid_observations INTEGER,
    mean_lice DOUBLE PRECISION,
    max_lice DOUBLE PRECISION,
    breach_rate_pct DOUBLE PRECISION,
    watch_rate_pct DOUBLE PRECISION,
    mean_temperature_c DOUBLE PRECISION,
    mean_ratio_to_limit DOUBLE PRECISION,
    mean_risk_score DOUBLE PRECISION,
    high_risk_weeks INTEGER
);

SELECT COUNT(*)
FROM locality_benchmark;

SELECT *
FROM locality_benchmark
LIMIT 10;

# Now check whether the import actually completed.
SELECT COUNT(*)
FROM locality_benchmark;

SELECT *
FROM locality_benchmark
LIMIT 20;

SELECT COUNT(*)
FROM locality_benchmark;

TRUNCATE TABLE locality_benchmark;


SELECT COUNT(*)
FROM locality_benchmark;


ALTER TABLE locality_benchmark
DROP CONSTRAINT locality_benchmark_pkey;

# create a composite primary KEY:
ALTER TABLE locality_benchmark
ADD CONSTRAINT locality_benchmark_pkey
PRIMARY KEY (locality_id, locality_name);

# IMPORT CSV file again
# VALIDATE
SELECT COUNT(*)
FROM locality_benchmark;

SELECT *
FROM locality_benchmark
WHERE locality_id = 32237;

--Verify that there are  no duplicate ID +name combination
SELECT	
   locality_id,
   locality_name,
   count(*)
FROM locality_benchmark
GROUP BY locality_id, locality_name
HAVING count(*) > 1;

--Validate table----no of rows---Duplicated ID--

SELECT count(*) AS total_rows
FROM locality_benchmark;

SELECT locality_id, locality_name
FROM locality_benchmark l
WHERE locality_id = 32237;

---ID + Name-------
SELECT 
	locality_id,
	locality_name,
	count(*) AS n
FROM locality_benchmark 
GROUP BY locality_id, locality_name
HAVING count(*) > 1;


---Now Inspect the feature CSV using terminal on ubnuntu

---head -1 data/processed/barentswatch_lice_2025_features.csv---
--wc -l data/processed/barentswatch_lice_2025_features.csv--
---head -1 data/processed/barentswatch_lice_2025_features.csv--































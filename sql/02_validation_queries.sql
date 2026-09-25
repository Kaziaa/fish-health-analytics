-- Check total rows in weekly_features
SELECT COUNT(*) AS total_rows
FROM weekly_features;


-- Check duplicate locality-year-week combinations
SELECT
    locality_id,
    year,
    week,
    COUNT(*) AS n
FROM weekly_features
GROUP BY locality_id, year, week
HAVING COUNT(*) > 1;


-- Check year and week ranges
SELECT
    MIN(year) AS min_year,
    MAX(year) AS max_year,
    MIN(week) AS min_week,
    MAX(week) AS max_week
FROM weekly_features;


-- Check overall breach statistics
SELECT
    COUNT(*) FILTER (WHERE compliance_code = 1) AS breaches,
    COUNT(*) FILTER (WHERE compliance_code IS NOT NULL) AS valid_observations,
    ROUND(
        100.0 *
        COUNT(*) FILTER (WHERE compliance_code = 1) /
        COUNT(*) FILTER (WHERE compliance_code IS NOT NULL),
        2
    ) AS breach_rate_pct
FROM weekly_features;
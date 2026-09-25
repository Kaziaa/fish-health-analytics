CREATE OR REPLACE VIEW grafana_locality_summary AS
SELECT
    locality_id,
    locality_name,
    AVG(adult_female_lice) AS mean_lice,
    MAX(adult_female_lice) AS max_lice,
    COUNT(*) FILTER (WHERE compliance_code = 1) AS breach_count,
    COUNT(*) FILTER (WHERE compliance_code IS NOT NULL) AS valid_observations
FROM weekly_features
GROUP BY locality_id, locality_name;

SELECT *
FROM grafana_locality_summary;

SELECT *
FROM grafana_locality_summary
ORDER BY breach_count DESC
LIMIT 20;
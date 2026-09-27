# Key Findings

## Dataset Coverage

The processed weekly dataset contained:

- **55,718 total weekly observations**
- **30,297 observations with valid compliance classification**
- **1,066 regulatory breaches**

The resulting overall breach rate among valid observations was approximately:

**3.52%**

## Lice Pressure and Compliance

Most valid weekly observations remained within the applicable lice limit, while a smaller subset of observations represented clear regulatory breaches.

Localities differed substantially in:

- mean adult female lice levels
- maximum observed lice levels
- number of breach weeks
- breach rate

This justified using both absolute breach counts and normalized locality-level breach rates.

## Temperature Association

Cleaned sea temperature showed a modest positive relationship with adult female lice levels.

The correlation between cleaned sea temperature and adult female lice was approximately:

**r = 0.148**

Weeks preceding a future breach occurred under warmer average conditions than weeks not followed by a breach.

Average current temperature was approximately:

- **9.63°C** for observations not followed by a breach
- **11.98°C** for observations followed by a breach

The 3-week temperature mean showed a similar pattern.

These results indicate an association between sustained warmer conditions and increased breach risk, but they do not establish causation.

## Early-Warning Rule

A simple warning rule combined:

- `ratio_to_limit >= 0.80`
- positive lice change
- current compliance

Observations classified as `Watch` had a substantially higher next-week breach rate than observations classified as `Normal`.

Approximate future breach rates were:

- **1.46%** for Normal observations
- **12.05%** for Watch observations

The Watch category captured approximately **38.8%** of subsequent breaches, while many future breaches remained outside this simple warning rule.

This demonstrates useful signal, but also shows that the rule should not be considered a complete predictive system.

## Exploratory Risk Score

An exploratory score combining:

- lice pressure
- positive recent lice growth
- recent temperature

produced a clear gradient across risk quartiles.

Observed future breach rates were approximately:

- **Q1 Low:** 0.08%
- **Q2:** 0.57%
- **Q3:** 2.28%
- **Q4 High:** 6.41%

The highest-risk quartile therefore contained substantially more future breaches than the lowest-risk quartile.

This result supports the value of combining biological pressure, temporal change, and environmental context.

However, the score was developed for exploratory decision support and was not externally validated.

## Locality Benchmarking

Locality-level benchmarking revealed substantial variation in:

- breach frequency
- mean lice pressure
- warning frequency
- temperature exposure
- exploratory risk score

These metrics can be used to distinguish localities with repeated compliance problems from those with only occasional high values.

## Operational Interpretation

The most useful monitoring variables were:

- adult female lice
- weekly regulatory limit
- ratio to limit
- recent lice change
- temperature trend
- warning status
- breach history

Together, these variables provide a more informative operational view than any single lice measurement alone.

## Overall Conclusion

The project demonstrates that routinely reported fish-health data can be transformed into a structured monitoring workflow that supports:

- regulatory-compliance tracking
- locality benchmarking
- early-warning analysis
- environmental context
- interactive operational visualization

The resulting PostgreSQL and Grafana workflow provides a practical prototype for aquaculture fish-health decision support.

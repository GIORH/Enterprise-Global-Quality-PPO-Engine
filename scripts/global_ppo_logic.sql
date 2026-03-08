/*
  PROJECT: Global PPO (Annual Objective) Tracking Automation
  DESCRIPTION: Consolidates multi-source performance data into a normalized 
               BigQuery table for executive reporting.
  TECH STACK: Google BigQuery (Standard SQL), CTEs, Window Functions.
*/

WITH raw_performance AS (
    -- Simulating data from disparate global sources
    SELECT 
        employee_id,
        region,
        objective_name,
        target_value,
        actual_performance,
        DATE(timestamp) as report_date
    FROM `your-project.stg_tables.global_kpis`
),

normalized_metrics AS (
    -- Normalizing performance percentages across different tiers
    SELECT 
        *,
        SAFE_DIVIDE(actual_performance, target_value) as attainment_pct,
        RANK() OVER(PARTITION BY region ORDER BY actual_performance DESC) as regional_rank
    FROM raw_performance
)

SELECT 
    employee_id,
    region,
    objective_name,
    attainment_pct,
    -- Business Logic: PPO Tier Classification
    CASE 
        WHEN attainment_pct >= 1.0 THEN 'Exceeds'
        WHEN attainment_pct >= 0.8 THEN 'Meets'
        ELSE 'Below'
    END as performance_tier,
    regional_rank
FROM normalized_metrics
WHERE report_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
ORDER BY attainment_pct DESC;

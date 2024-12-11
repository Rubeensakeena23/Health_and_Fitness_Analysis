WITH combined_data AS (
  SELECT
    sleep.date,
    sleep.In_bed_in_hours,
    heart_rate.resting_heart_rate_in_bpm
  FROM
    `new-york-project-436613.Fitness_Tracking.sleep_analysis` AS sleep
  JOIN
    `new-york-project-436613.Fitness_Tracking.resting_heart_rate` AS heart_rate
  ON
    sleep.date = heart_rate.date
),
stats AS (
  SELECT
    COUNT(*) AS n,
    AVG(In_bed_in_hours) AS avg_sleep,
    AVG(resting_heart_rate_in_bpm) AS avg_hr,
    SUM((In_bed_in_hours - (SELECT AVG(In_bed_in_hours) FROM combined_data)) * 
        (resting_heart_rate_in_bpm - (SELECT AVG(resting_heart_rate_in_bpm) FROM combined_data))) AS numerator,
    SUM(POW(In_bed_in_hours - (SELECT AVG(In_bed_in_hours) FROM combined_data), 2)) AS denominator_x,
    SUM(POW(resting_heart_rate_in_bpm - (SELECT AVG(resting_heart_rate_in_bpm) FROM combined_data), 2)) AS denominator_y
  FROM 
    combined_data
)
SELECT
  numerator / SQRT(denominator_x * denominator_y) AS correlation
FROM 
  stats;

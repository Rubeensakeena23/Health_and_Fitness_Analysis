SELECT
  FORMAT_DATE('%Y-%m', DATE_TRUNC(date, MONTH)) AS month,
  ROUND(AVG(In_bed_in_hours), 2) AS sleep_time
FROM
  `new-york-project-436613.Fitness_Tracking.sleep_analysis`
GROUP BY
  month
ORDER BY
  sleep_time DESC
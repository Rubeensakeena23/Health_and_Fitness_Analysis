SELECT
  FORMAT_DATE('%Y-%m', DATE_TRUNC(heart_rate.date, MONTH)) AS month,
  ROUND(AVG(min_hr), 2) AS average_min_hr,
  ROUND(AVG(max_hr), 2) AS average_max_hr,
  ROUND(AVG(avg_hr), 2) AS average_hr,
  ROUND(AVG(resting_heart_rate_in_bpm), 2) AS average_resting_hr
FROM
  `new-york-project-436613.Fitness_Tracking.heart_rate` AS heart_rate
  JOIN
  `new-york-project-436613.Fitness_Tracking.resting_heart_rate` AS resting_heart_rate
  ON
  heart_rate.date = resting_heart_rate.date
GROUP BY
  month
ORDER BY
  month

  

SELECT
  FORMAT_DATE('%Y-%m', DATE_TRUNC(body_weight.date, MONTH)) AS month,
  ROUND(AVG(weight_in_kg), 2) AS average_weight
FROM
  `new-york-project-436613.Fitness_Tracking.body_weight` AS body_weight
GROUP BY
  month
ORDER BY
  month
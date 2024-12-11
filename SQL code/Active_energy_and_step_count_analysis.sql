SELECT
  FORMAT_DATE('%Y-%m', DATE_TRUNC(step_count.date, MONTH)) AS month,
  ROUND(AVG(step_count.step_count)) AS average_steps,
  ROUND(AVG(walking_distance.walking_and_running_distance_in_km), 2) AS average_distance,
  ROUND(AVG(active_energy.active_energy_in_kcal), 2) AS calories_burnt,
  ROUND(AVG(exercise_time.exercise_time_in_mins), 2) AS exercise_mins
FROM
  `new-york-project-436613.Fitness_Tracking.step_count` AS step_count 
  JOIN `new-york-project-436613.Fitness_Tracking.walking_distance` AS walking_distance
  ON step_count.date = walking_distance.date
  JOIN
  `new-york-project-436613.Fitness_Tracking.active_energy` AS active_energy
  ON walking_distance.date = active_energy.date
  JOIN
  `new-york-project-436613.Fitness_Tracking.exercise_time` AS exercise_time
  ON exercise_time.date = active_energy.date
GROUP BY
  month
ORDER BY
  month

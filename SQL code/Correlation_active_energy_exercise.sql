SELECT
  CORR(active_energy.active_energy_in_kcal, exercise_time.exercise_time_in_mins) AS correlation_active_exercise
FROM
  `new-york-project-436613.Fitness_Tracking.active_energy` AS active_energy
JOIN
  `new-york-project-436613.Fitness_Tracking.exercise_time` AS exercise_time
ON
  active_energy.date = exercise_time.date;
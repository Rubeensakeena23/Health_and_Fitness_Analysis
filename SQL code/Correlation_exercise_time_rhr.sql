SELECT 
  CORR(exercise_time_in_mins, resting_heart_rate_in_bpm) AS correlation_coefficient
FROM 
  `new-york-project-436613.Fitness_Tracking.resting_heart_rate` AS resting_hr
  JOIN
  `new-york-project-436613.Fitness_Tracking.exercise_time` AS exercise_time
  ON resting_hr.date = exercise_time.date

SELECT
  pd.cycle_phase,
  ROUND(AVG(ae.active_energy_in_kcal), 2) AS avg_active_energy,
  ROUND(AVG(sc.step_count), 2) AS avg_step_count,
  ROUND(AVG(et.exercise_time_in_mins), 2) AS avg_exercise_minutes
FROM
  `new-york-project-436613.Fitness_Tracking.active_energy` ae
JOIN
  `new-york-project-436613.Fitness_Tracking.period_data` pd
ON
  ae.date = pd.date
JOIN
  `new-york-project-436613.Fitness_Tracking.step_count` sc
ON pd.date = sc.date
JOIN
  `new-york-project-436613.Fitness_Tracking.exercise_time` et
ON sc.date = et.date
GROUP BY
  pd.cycle_phase
ORDER BY
  CASE
    WHEN cycle_phase = 'Menstrual Phase' THEN 1
    WHEN cycle_phase = 'Follicular Phase' THEN 2
    WHEN cycle_phase = 'Ovulation Phase' THEN 3
    WHEN cycle_phase = 'Luteal Phase' THEN 4
    ELSE 5 
  END;


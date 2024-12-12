SELECT
  pd.cycle_phase,
  ROUND(AVG(rhr.resting_heart_rate_in_bpm), 2) AS avg_resting_heart_rate
FROM
  `new-york-project-436613.Fitness_Tracking.resting_heart_rate` rhr
JOIN
  `new-york-project-436613.Fitness_Tracking.period_data` pd
ON
  rhr.date = pd.date
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

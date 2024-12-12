SELECT
  cycle_phase,
  COUNT(DISTINCT date) AS phase_duration_days
FROM
  `new-york-project-436613.Fitness_Tracking.period_data`
GROUP BY
  cycle_phase
ORDER BY
  CASE
    WHEN cycle_phase = 'Menstrual Phase' THEN 1
    WHEN cycle_phase = 'Follicular Phase' THEN 2
    WHEN cycle_phase = 'Ovulation Phase' THEN 3
    WHEN cycle_phase = 'Luteal Phase' THEN 4
    ELSE 5 
  END;

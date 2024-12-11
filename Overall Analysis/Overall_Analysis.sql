WITH CategorizedDays AS (
  SELECT
    DISTINCT ae.date,
    CASE
      WHEN ae.active_energy_in_kcal >= 700 AND sc.step_count >= 10000 THEN 'Active'
      WHEN (ae.active_energy_in_kcal BETWEEN 500 AND 699) OR (sc.step_count BETWEEN 7000 AND 9999) THEN 'Moderate'
      ELSE 'Sedentary'
    END AS activity_category,
    ae.active_energy_in_kcal,
    sc.step_count
  FROM
    `new-york-project-436613.Fitness_Tracking.active_energy` ae
  JOIN
    `new-york-project-436613.Fitness_Tracking.step_count` sc
  ON ae.date = sc.date
),
Metrics AS (
  SELECT
    cd.date,
    cd.activity_category,
    COALESCE(rh.resting_heart_rate_in_bpm, 0) AS resting_heart_rate,
    COALESCE(sl.In_bed_in_hours, 0) AS sleep_hours,
    COALESCE(em.exercise_time_in_mins, 0) AS exercise_minutes,
    cd.active_energy_in_kcal,
    cd.step_count
  FROM
    CategorizedDays cd
  LEFT JOIN
    `new-york-project-436613.Fitness_Tracking.resting_heart_rate` rh
  ON cd.date = rh.date
  LEFT JOIN
    `new-york-project-436613.Fitness_Tracking.sleep_analysis` sl
  ON cd.date = sl.date
  LEFT JOIN
    `new-york-project-436613.Fitness_Tracking.exercise_time` em
  ON cd.date = em.date
)
SELECT
  activity_category,
  COUNT(DISTINCT cd.date) AS total_days,
  ROUND(AVG(resting_heart_rate), 2) AS avg_resting_heart_rate,
  ROUND(AVG(sleep_hours), 2) AS avg_sleep_hours,
  ROUND(AVG(exercise_minutes), 2) AS avg_exercise_minutes,
  ROUND(AVG(active_energy_in_kcal), 2) AS avg_active_energy,
  ROUND(AVG(step_count), 2) AS avg_step_count
FROM
  Metrics cd
GROUP BY
  activity_category
ORDER BY
  avg_active_energy DESC

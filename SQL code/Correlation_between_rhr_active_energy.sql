SELECT 
    (SUM((rhr - avg_rhr) * (active_energy - avg_active_energy)) / 
    (COUNT(*) - 1)) / 
    (STDDEV_POP(rhr) * STDDEV_POP(active_energy)) AS correlation
FROM (
    SELECT 
        resting_heart_rate.resting_heart_rate_in_bpm AS rhr,
        active_energy.active_energy_in_kcal AS active_energy,
        AVG(resting_heart_rate.resting_heart_rate_in_bpm) OVER () AS avg_rhr,
        AVG(active_energy.active_energy_in_kcal) OVER () AS avg_active_energy
    FROM `new-york-project-436613.Fitness_Tracking.resting_heart_rate` AS resting_heart_rate
    JOIN
    `new-york-project-436613.Fitness_Tracking.active_energy` AS active_energy
    ON resting_heart_rate.date = active_energy.date
) subquery

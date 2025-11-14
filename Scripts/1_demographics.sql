-- Calculate length of stay for each patient

SELECT
    name,
    date_of_admission,
    discharge_date,
    (discharge_date::date - date_of_admission::date) AS days_admitted
FROM healthcare_dataset
ORDER BY days_admitted DESC;

-- Explore trends with length of stay

SELECT
    name,
    medical_condition,
    (discharge_date::date - date_of_admission::date) AS days_admitted
FROM healthcare_dataset
ORDER BY days_admitted DESC;

-- Count patients by gender and medical condition
SELECT
    gender,
    medical_condition,
    COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY gender, medical_condition
ORDER BY gender, patient_count DESC;

-- Create age buckets and count conditions

SELECT
    CASE
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 49 THEN '30-49'
        WHEN age BETWEEN 50 AND 69 THEN '50-69'
        ELSE '70+'
    END AS age_group,
    medical_condition,
    COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY age_group, medical_condition
ORDER BY age_group, patient_count DESC;

-- Which conditions keep male vs. female patients longer in the hospital?

SELECT
    gender,
    medical_condition,
    ROUND(AVG(discharge_date::date - date_of_admission::date)::NUMERIC, 2) AS avg_length_of_stay,
    COUNT(*) AS patient_count
FROM healthcare_dataset
GROUP BY gender, medical_condition
ORDER BY gender, medical_condition DESC;

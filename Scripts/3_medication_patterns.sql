WITH medication_results AS (
    SELECT 
        medical_condition,
        medication,
        test_results,
        COUNT(*) AS patient_count
    FROM healthcare_dataset
    GROUP BY 
        medical_condition,
        medication,
        test_results
)

SELECT 
    medical_condition,
    medication,
    SUM(patient_count) AS total_patients,
    SUM(CASE WHEN test_results = 'Normal' THEN patient_count ELSE 0 END) AS normal_results,
    SUM(CASE WHEN test_results = 'Abnormal' THEN patient_count ELSE 0 END) AS abnormal_results,
    SUM(CASE WHEN test_results = 'Inconclusive' THEN patient_count ELSE 0 END) AS inconclusive_results,
    ROUND(
        SUM(CASE WHEN test_results = 'Normal' THEN patient_count ELSE 0 END) * 100.0
        / NULLIF(SUM(patient_count), 0), 2
    ) AS percent_normal,
    ROUND(
        SUM(CASE WHEN test_results = 'Abnormal' THEN patient_count ELSE 0 END) * 100.0
        / NULLIF(SUM(patient_count), 0), 2
    ) AS percent_abnormal
FROM medication_results
GROUP BY 
    medical_condition,
    medication
ORDER BY 
    medical_condition,
    percent_normal DESC;

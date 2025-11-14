SELECT 
    medical_condition,
    ROUND(AVG(billing_amount)::NUMERIC, 2) AS avg_billing_amount,
    ROUND(MIN(billing_amount)::NUMERIC, 2) AS min_billing_amount,
    ROUND(MAX(billing_amount)::NUMERIC, 2) AS max_billing_amount,
    COUNT(*) AS num_patients
FROM healthcare_dataset 
GROUP BY medical_condition
ORDER BY avg_billing_amount DESC;

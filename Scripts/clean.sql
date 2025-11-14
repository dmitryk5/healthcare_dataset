-- Clean name case to Initial Capitalization

UPDATE healthcare_dataset
SET "Name" = INITCAP("Name");

UPDATE healthcare_dataset
SET 

-- Change column names to lowercase and with underscores
ALTER TABLE healthcare_dataset
RENAME COLUMN "Name" TO name;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Age" TO age;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Blood Type" TO blood_type;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Medical Condition" TO medical_condition;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Date of Admission" TO date_of_admission;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Doctor" TO doctor;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Hospital" TO hospital;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Insurance Provider" TO insurance_provider;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Billing Amount" TO billing_amount;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Room Number" TO room_number;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Admission Type" TO admission_type;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Discharge Date" TO discharge_date;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Medication" TO medication;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Test Results" TO test_results;

ALTER TABLE healthcare_dataset
RENAME COLUMN "Gender" TO gender;

-- Remove titles and title 'MD' from patient AND doctor names
UPDATE healthcare_dataset
SET doctor = INITCAP(
    REGEXP_REPLACE(
        TRIM(doctor),
        '^(Dr\.|Mr\.|Mrs\.)\s*|\s+(MD|DVM|DDS)$',
        '',
        'gi'
    )
);

-- patients

UPDATE healthcare_dataset
SET name = INITCAP(
    REGEXP_REPLACE(
        TRIM(name),
        '^(Dr\.|Mr\.|Mrs\.)\s*|\s+(MD|DVM|DDS)$',
        '',
        'gi'
    )
);














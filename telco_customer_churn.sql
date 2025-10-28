CREATE DATABASE telco_churn_analysis;
USE telco_churn_analysis;

SELECT DATABASE();
SELECT 
    *
FROM
    customer_churn
LIMIT 5;

-- Count total number of customers
SELECT 
    COUNT(*) AS total_customers
FROM
    customer_churn;

-- Check the data types and see a sample
DESCRIBE customer_churn;

-- First, let's see what the empty TotalCharges records look like
SELECT 
    customerID, tenure, MonthlyCharges, TotalCharges
FROM
    customer_churn
WHERE
    TotalCharges = '' OR TotalCharges = ' ';

-- Check what's in TotalCharges that's causing it to be text datatype
SELECT 
    TotalCharges, COUNT(*)
FROM
    customer_churn
GROUP BY TotalCharges
ORDER BY TotalCharges
LIMIT 10;

-- Check for empty strings or spaces in TotalCharges
SELECT 
    TotalCharges, COUNT(*)
FROM
    customer_churn
WHERE
    TotalCharges = '' OR TotalCharges = ' '
        OR TotalCharges IS NULL
GROUP BY TotalCharges;

-- we realised where tenure = 0 all the total charges are also 0 meaning they are new customers 

SELECT 
    customerID, tenure, MonthlyCharges, TotalCharges
FROM
    customer_churn
WHERE
    (TotalCharges = '' OR TotalCharges = ' ')
        AND tenure = 0;

-- Update empty TotalCharges to 0 for new customers
UPDATE customer_churn 
SET 
    TotalCharges = 0
WHERE
    (TotalCharges = '' OR TotalCharges = ' '
        OR TotalCharges IS NULL)
        AND tenure = 0;

-- Check if the empty values are now '0'
SELECT 
    customerID, tenure, MonthlyCharges, TotalCharges
FROM
    customer_churn
WHERE
    tenure = 0;

-- Convert TotalCharges to decimal number
ALTER TABLE customer_churn 
MODIFY COLUMN TotalCharges DECIMAL(10,2);

-- Check for missing values in other columns
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE
        WHEN customerID IS NULL OR customerID = '' THEN 1
        ELSE 0
    END) AS missing_customerID,
    SUM(CASE
        WHEN tenure IS NULL THEN 1
        ELSE 0
    END) AS missing_tenure,
    SUM(CASE
        WHEN MonthlyCharges IS NULL THEN 1
        ELSE 0
    END) AS missing_monthly,
    SUM(CASE
        WHEN TotalCharges IS NULL THEN 1
        ELSE 0
    END) AS missing_total
FROM
    customer_churn;

-- Check values in key categorical columns
SELECT 
    'Gender' AS column_name, gender AS value, COUNT(*) AS count
FROM
    customer_churn
GROUP BY gender 
UNION ALL SELECT 
    'Partner', Partner, COUNT(*)
FROM
    customer_churn
GROUP BY Partner 
UNION ALL SELECT 
    'Dependents', Dependents, COUNT(*)
FROM
    customer_churn
GROUP BY Dependents 
UNION ALL SELECT 
    'Churn', Churn, COUNT(*)
FROM
    customer_churn
GROUP BY Churn 
UNION ALL SELECT 
    'PhoneService', PhoneService, COUNT(*)
FROM
    customer_churn
GROUP BY PhoneService;

-- Check service-related categorical columns
SELECT 
    'MultipleLines' AS column_name,
    MultipleLines AS value,
    COUNT(*) AS count
FROM
    customer_churn
GROUP BY MultipleLines 
UNION ALL SELECT 
    'OnlineSecurity', OnlineSecurity, COUNT(*)
FROM
    customer_churn
GROUP BY OnlineSecurity 
UNION ALL SELECT 
    'OnlineBackup', OnlineBackup, COUNT(*)
FROM
    customer_churn
GROUP BY OnlineBackup 
UNION ALL SELECT 
    'TechSupport', TechSupport, COUNT(*)
FROM
    customer_churn
GROUP BY TechSupport;

-- Update MultipleLines: change "No phone service" to "No"
UPDATE customer_churn 
SET 
    MultipleLines = 'No'
WHERE
    MultipleLines = 'No phone service';

-- Update OnlineSecurity: change "No internet service" to "No"  
UPDATE customer_churn 
SET 
    OnlineSecurity = 'No'
WHERE
    OnlineSecurity = 'No internet service';

-- Update OnlineBackup: change "No internet service" to "No"
UPDATE customer_churn 
SET 
    OnlineBackup = 'No'
WHERE
    OnlineBackup = 'No internet service';

-- Check the updated values
SELECT 
    'MultipleLines' AS column_name,
    MultipleLines AS value,
    COUNT(*) AS count
FROM
    customer_churn
GROUP BY MultipleLines 
UNION ALL SELECT 
    'OnlineSecurity', OnlineSecurity, COUNT(*)
FROM
    customer_churn
GROUP BY OnlineSecurity 
UNION ALL SELECT 
    'OnlineBackup', OnlineBackup, COUNT(*)
FROM
    customer_churn
GROUP BY OnlineBackup;

-- Final data summary
SELECT 
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customerID) AS unique_customers,
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    AVG(MonthlyCharges) AS avg_monthly_charges,
    AVG(TotalCharges) AS avg_total_charges,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,
    ROUND(SUM(CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS churn_rate
FROM
    customer_churn;

-- change "No internet service" to "No"
UPDATE customer_churn 
SET 
    DeviceProtection = 'No'
WHERE
    DeviceProtection = 'No internet service';

-- change "No internet service" to "No"  
UPDATE customer_churn 
SET 
    TechSupport = 'No'
WHERE
    TechSupport = 'No internet service';

-- change "No internet service" to "No"
UPDATE customer_churn 
SET 
    StreamingTV = 'No'
WHERE
    StreamingTV = 'No internet service';

-- change "No internet service" to "No"
UPDATE customer_churn 
SET 
    StreamingMovies = 'No'
WHERE
    StreamingMovies = 'No internet service';

-- Check all service columns now only have Yes/No
SELECT 
    'DeviceProtection' AS column_name,
    DeviceProtection AS value,
    COUNT(*) AS count
FROM
    customer_churn
GROUP BY DeviceProtection 
UNION ALL SELECT 
    'TechSupport', TechSupport, COUNT(*)
FROM
    customer_churn
GROUP BY TechSupport 
UNION ALL SELECT 
    'StreamingTV', StreamingTV, COUNT(*)
FROM
    customer_churn
GROUP BY StreamingTV 
UNION ALL SELECT 
    'StreamingMovies', StreamingMovies, COUNT(*)
FROM
    customer_churn
GROUP BY StreamingMovies;
    
    -- Export our cleaned data for Python
SELECT 
    *
FROM
    customer_churn
LIMIT 10000;

SELECT 
    COUNT(*) AS total_customers
FROM
    customer_churn;


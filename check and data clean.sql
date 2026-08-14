USE group_project;

-- First, check the table structure and row count
DESCRIBE  `telco-customer`;
SELECT COUNT(*) FROM `telco-customer`;
-- o/p There is 7044 rows

-- Check for duplicate customerIDs (should be unique)

SELECT customerID, COUNT(*) 
FROM  `telco-customer`
GROUP BY customerID
HAVING COUNT(*) > 1;
-- o/p There is not duplicate customerIDs


-- Check for NULLs / blanks across all columns

SELECT 
  SUM(customerID IS NULL) AS customerID_null,
  SUM(gender IS NULL OR gender = '') AS gender_null,
  SUM(SeniorCitizen IS NULL) AS SeniorCitizen_null,
  SUM(Partner IS NULL OR Partner = '') AS Partner_null,
  SUM(Dependents IS NULL OR Dependents = '') AS Dependents_null,
  SUM(tenure IS NULL) AS tenure_null,
  SUM(PhoneService IS NULL OR PhoneService = '') AS PhoneService_null,
  SUM(MultipleLines IS NULL OR MultipleLines = '') AS MultipleLines_null,
  SUM(InternetService IS NULL OR InternetService = '') AS InternetService_null,
  SUM(MonthlyCharges IS NULL) AS MonthlyCharges_null,
  SUM(TotalCharges IS NULL OR TotalCharges = '') AS TotalCharges_null,
  SUM(Churn IS NULL OR Churn = '') AS Churn_null
FROM  `telco-customer`;
--  o/p There is no null/blank values


-- Check the blank and junk vales

SELECT customerID, tenure, TotalCharges
FROM  `telco-customer`
WHERE TRIM(TotalCharges) = '' OR TotalCharges REGEXP '^[A-Za-z ]+$';
--  o/p There is not no blank and junk values



-- Check categorical columns for inconsistent values

 SELECT DISTINCT gender FROM  `telco-customer`;
 -- o/p is male,female
SELECT DISTINCT Contract FROM  `telco-customer`;
 -- o/p is Month-to-Month, One year , Two year
SELECT DISTINCT PaymentMethod FROM  `telco-customer`;
  -- o/p Electronic check,Mailed check,Bank transfer (automatic),Credit card (automatic) There are some method used by coustomer
SELECT DISTINCT InternetService FROM  `telco-customer`;
 -- DSL, Fiber opic, NO
SELECT DISTINCT Churn FROM `telco-customer`;
  -- o/p No,Yes





 
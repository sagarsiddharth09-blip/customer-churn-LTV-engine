USE group_project;

-- Total customers who left

SELECT COUNT(*) AS churned_customers
FROM `telco-customer`
WHERE Churn = 'Yes';

-- Churn percentage

SELECT 
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_pct
FROM `telco-customer`;

-- Churn by Contract type

SELECT Contract,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_pct
FROM `telco-customer`
GROUP BY Contract
ORDER BY churn_pct DESC;

-- Churn by InternetService

SELECT InternetService,
  COUNT(*) AS total_customers,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_pct
FROM `telco-customer`
GROUP BY InternetService
ORDER BY churn_pct DESC;

-- Churn by PaymentMethod

SELECT PaymentMethod,
  COUNT(*) AS total_customers,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_pct
FROM `telco-customer`
GROUP BY PaymentMethod
ORDER BY churn_pct DESC;


-- Churn by tenure

SELECT 
  CASE 
    WHEN tenure BETWEEN 0 AND 12 THEN '0-12'
    WHEN tenure BETWEEN 13 AND 24 THEN '13-24'
    WHEN tenure BETWEEN 25 AND 36 THEN '25-36'
    WHEN tenure BETWEEN 37 AND 48 THEN '37-48'
    WHEN tenure BETWEEN 49 AND 60 THEN '49-60'
    ELSE '61-72'
  END AS tenure_group,
  COUNT(*) AS total_customers,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_pct
FROM `telco-customer`
GROUP BY tenure_group
ORDER BY MIN(tenure);
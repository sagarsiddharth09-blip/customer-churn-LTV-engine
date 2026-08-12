-- check the data:
select * from telco_customers limit 10;

-- check total rows:
select count(*) as total_rows from telco_customers;

-- check total columns:
select count(*) as total_columns 
from information_schema.columns
where table_name ='telco_customers';

-- check duplicates in customerid column:
select customerid,count(*) as customers_count from telco_customers
group by customerid
having count(*)>1; 

-- check missing values:
select count(*) as total_rows,
count(customerid) as customers_count,
count(gender) as gender_count,
count(seniorcitizen) as citizen_count,
count(tenure) as tenure_count,
count(monthlycharges) as monthlycharges_count,
count(totalcharges) as totalcharges_count,
count(churn) as churn_count
from telco_customers;

-- check blank values:
select count(*) as blank_counts
from telco_customers
where trim(totalcharges)='';

-- check churn:
select churn,
count(*) as total_count,
round(count(*)*100.0/(select count(*) from telco_customers),2) as churn_percentage
from telco_customers
group by churn;

-- analyze important categorical columns:
-- Contract
select contract,count(*) as customer_count,
round(count(*)*100.0/(select count(*) from telco_customers),2) as total_percentage
from telco_customers
group by contract
order by customer_count desc;

-- Paymentmethod
select paymentmethod,count(*) as customer_count,
round(count(*)*100.0/(select count(*) from telco_customers),2) as total_percentage
from telco_customers
group by paymentmethod
order by customer_count desc;

-- Internet Service
select 
internetservice,
count(*) as total_customer
from telco_customers
group by internetservice
order by total_customer desc
;

-- Check numerical ranges:
-- Tenure
select
min(tenure) as min_tenure,
max(tenure) as max_tenure,
round(avg(tenure),2) as avg_tenure
from telco_customers;

-- monthly charges
select
min(monthlycharges) as min_monthly_charge,
max(monthlycharges) as max_monthly_charge,
round(avg(monthlycharges),3) as avg_monthly_charge
from telco_customers;






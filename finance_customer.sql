create database finance;
use finance;
create table INFO(
customer_id	text,
emp_title text,
emp_length text,
home_ownership text,
annual_inc	text,
annual_inc_joint text,
verification_status	text,
zip_code text,
addr_state text,
avg_cur_bal	text,
Tot_cur_bal text
);
SHOW VARIABLES LIKE 'secure_file_priv';
drop table INFO;
SET SQL_SAFE_UPDATES = 0;

SET GLOBAL local_infile = 1;
-- "D:\Pandas\Finance data\finance customer.csv"
SET global local_infile=on;
-- finance customer.csv

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/finance_customer.csv'
   INTO TABLE INFO
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\r\n'
   IGNORE 1 ROWS;

select * from finance_customer;

select count(emp_length) as find_none
from finance_customer
where emp_length = 'none'
group by emp_length;

select customer_id , zip_code
from finance_customer
where zip_code = '010xx';

select customer_id , zip_code
from finance_customer
where zip_code = '107xx';

select * 
from finance_customer
WHERE emp_title = 'none'
  or emp_length = 'none'
  or home_ownership = 'none'
  or annual_inc = 'none'
  or annual_inc_joint = 'none'
  or verification_status = 'none'
  or zip_code = 'none'
  or addr_state = 'none'
  or avg_cur_bal = 'none'
  or Tot_cur_bal = 'none';
  
  
select customer_id , verification_status
from finance_customer
where verification_status = 'Not Verified'
group by  customer_id, verification_status;
  
  

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
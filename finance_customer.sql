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
  
  
select customer_id , emp_title , emp_length , addr_state
from finance_customer
where addr_state = 'NY';

-- first find how many people take loan in NY after that find there id and find customer id whom take Mortage and find highest annual_inc

select count(addr_state)as counts, addr_state
from finance_customer
where addr_state = 'NY'
group by addr_state;

select customer_id , home_ownership
from finance_customer
where home_ownership = 'Mortgage';

select customer_id , annual_inc
from finance_customer
where annual_inc = (select max(annual_inc) 
					from finance_customer);
                    
select addr_state , count(addr_state)
from finance_customer
group by addr_state;
-- try to find all addr_state and then find avg avg_cur_bal
select avg(avg_cur_bal)
from finance_customer;
-- first change a datatype of Tot_cur_bal and convert in begint and then find highest Tot_cur_bal with there name 
select customer_id ,Tot_cur_bal
from finance_customer
where Tot_cur_bal = (select max(Tot_cur_bal)from finance_customer);


-- find highest Tot_cur_bal where verification_status is verified after that find annual_inc = noneafter that create procedure for See the result Mortgage

select customer_id , verification_status , Tot_cur_bal
from finance_customer
where Tot_cur_bal = (select max(Tot_cur_bal)from finance_customer
						where verification_status = 'Verified');
                        

select customer_id , annual_inc
from finance_customer
where annual_inc = 'none';

delimiter $$
create procedure Mortgage()
begin
select * from finance_customer
where home_ownership = 'Mortgage';
end $$
delimiter ;

call Mortgage;

-- first create a view for Verification_status_verified after that creat view for addr_state_MA

create view Verification_status_verified as
select customer_id , home_ownership , annual_inc , verification_status
from finance_customer
where verification_status = 'Verified';

select * from Verification_status_verified;

create view addr_state_MA as
select * from finance_customer
where addr_state = 'MA';

select * from addr_state_MA;

-- now find the highest annual income for each verification_status after that find minimum avg cur bal and then find avg cur_bal state_wise 

select customer_id , verification_status,annual_inc
from finance_customer f1
where annual_inc = (select max(f2.annual_inc)from finance_customer f2
					where f1.verification_status = f2.verification_status);
                    
				
select customer_id , emp_title , verification_status , annual_inc , avg_cur_bal
from finance_customer
where avg_cur_bal = (select min(avg_cur_bal)from finance_customer);


select addr_state , avg_cur_bal
from finance_customer f1
where avg_cur_bal = (select avg(f2.avg_cur_bal)from finance_customer f2
					where f1.addr_state = f2.addr_state);

select addr_state , avg(avg_cur_bal)
from finance_customer
group by addr_state;

select home_ownership , max(avg_cur_bal)
from finance_customer
group by home_ownership;

select customer_id , emp_length,annual_inc
from finance_customer
where emp_length != 'none';

select zip_code , count(zip_code)
from finance_customer
group by zip_code
having count(zip_code) >1;

select customer_id,annual_inc as second_highest_Salary
from finance_customer
where annual_inc = (select max(annual_inc)from finance_customer
					where annual_inc < (select max(annual_inc)from finance_customer));

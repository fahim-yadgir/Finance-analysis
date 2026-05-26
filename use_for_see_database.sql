use finance;

select *from finance_customer;


ALTER TABLE finance_customer
MODIFY Tot_cur_bal BIGINT;


select customer_id ,Tot_cur_bal
from finance_customer
where Tot_cur_bal = (select max(Tot_cur_bal)from finance_customer);

alter table finance_customer
rename column emp_length to experienc;

create view Full_details as
select * from finance_customer
where customer_id != 'none' and emp_title != 'none'  and experienc != 'none' and home_ownership != 'none' and annual_inc != 'none' and annual_inc_joint != 'none' and verification_status != 'none' and verification_status != 'none' and zip_code != 'none' and addr_state != 'none' and avg_cur_bal != 'none' and tot_cur_bal != 'none' ;
drop view Full_details;

select * from Full_details;

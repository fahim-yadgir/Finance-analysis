use finance;

select *from finance_customer;


ALTER TABLE finance_customer
MODIFY Tot_cur_bal BIGINT;


select customer_id ,Tot_cur_bal
from finance_customer
where Tot_cur_bal = (select max(Tot_cur_bal)from finance_customer);

alter table finance_customer
rename column emp_length to experienc;

alter table finance_customer
modify avg_cur_bal bigint;

select * from finance_customer
where avg_cur_bal = (select max(avg_cur_bal)from finance_customer 
					where avg_cur_bal < (select max(avg_cur_bal) from finance_customer));
                    
                    
select *,
	sum(Tot_cur_bal) over (partition by home_ownership order by customer_id)as cumulative_sum_home_ownership
from finance_customer
where home_ownership = 'Rent';


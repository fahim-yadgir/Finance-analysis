use finance;

select * from finance_customer;

ALTER TABLE finance_customer
MODIFY Tot_cur_bal BIGINT;

select customer_id , Tot_cur_bal
from finance_customer
where Tot_cur_bal >= 408091;

select customer_id ,Tot_cur_bal
from finance_customer
where Tot_cur_bal = (select max(Tot_cur_bal)from finance_customer)

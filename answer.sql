/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */
create table test as 
select Date(transaction_time) as days, SUM(transaction_amount) as totals
from transactions group by DATE(transaction_time);

select days, totals, 
avg(totals) over(order by days rows between 2 preceding and current row) as rolling_average from test;
​

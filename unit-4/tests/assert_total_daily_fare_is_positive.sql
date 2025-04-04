-- Return records where daily fare_amount < 0 to make the test fail.
select
    pickup_date,
    sum(fare_amount) as total_amount
from {{ ref('int_trips__formatted') }}
group by pickup_date
having total_amount < 0
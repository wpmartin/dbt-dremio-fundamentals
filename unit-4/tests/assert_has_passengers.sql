-- Return records where passenger_count < 0 to make the test fail.
select
    passenger_count
from {{ ref('stg_trips__formatted') }}
where passenger_count < 0
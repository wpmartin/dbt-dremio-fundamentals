SELECT 
    pickup_date,
    pickup_time,
    passenger_count,
    trip_distance,
    total_amount
FROM
    {{ ref('int_trips__formatted') }}

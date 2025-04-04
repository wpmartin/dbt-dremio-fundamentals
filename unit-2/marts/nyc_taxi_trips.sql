SELECT 
    pickup_date,
    passenger_count,
    trip_distance,
    total_amount,
    average_wind,
    precipitation,
    temp_max,
    temp_min
FROM
    {{ ref('int_trips_weather__join') }}
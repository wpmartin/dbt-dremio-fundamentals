SELECT 
    station,
    "date",
    temp_max,
    temp_min
FROM
    {{ ref('int_weather__formatted') }}
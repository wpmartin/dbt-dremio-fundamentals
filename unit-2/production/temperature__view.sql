SELECT 
    station,
    "date",
    temp_max,
    temp_min
FROM
    {{ ref('stg_weather__formatted') }}
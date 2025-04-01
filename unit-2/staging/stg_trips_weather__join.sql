SELECT * 
FROM 
    {{ ref('stg_trips__formatted') }} as t INNER JOIN {{ ref('stg_weather__formatted') }} as w ON t.pickup_date = w."date";
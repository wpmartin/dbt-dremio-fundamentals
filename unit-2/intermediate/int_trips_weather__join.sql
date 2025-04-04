SELECT * 
FROM 
    {{ ref('int_trips__formatted') }} as t INNER JOIN {{ ref('int_weather__formatted') }} as w ON t.pickup_date = w."date";
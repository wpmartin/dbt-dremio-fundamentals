--Create NYC Taxi View with cleaned attribute names and values
SELECT 
    TO_TIME(pickup_time, 'HH24:MI:SS', 1) AS pickup_time,
    TO_DATE(pickup_date, 'YYYY-MM-DD', 1) AS pickup_date,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    total_amount
FROM   (SELECT 
            CASE WHEN LENGTH(SUBSTR(trips."pickup_datetime", 12, LENGTH(trips."pickup_datetime") - 15)) > 0 THEN SUBSTR(trips."pickup_datetime", 12, LENGTH(trips."pickup_datetime") - 15) ELSE NULL END AS pickup_time,
            CASE WHEN LENGTH(SUBSTR(trips."pickup_datetime", 1, 10)) > 0 THEN SUBSTR(trips."pickup_datetime", 1, 10) ELSE NULL END AS pickup_date,
            CONVERT_TO_INTEGER(trips."passenger_count", 1, 0, 0) AS passenger_count,
            CONVERT_TO_FLOAT(trips."trip_distance_mi", 1, 1, 0) AS trip_distance,
            CONVERT_TO_FLOAT(trips."fare_amount", 1, 1, 0) AS fare_amount,
            CONVERT_TO_FLOAT(trips."tip_amount", 1, 1, 0) AS tip_amount,
            CONVERT_TO_FLOAT(trips."total_amount", 1, 1, 0) AS total_amount
        FROM  nessie.workshop.raw.trips  AS trips

) nested_0;
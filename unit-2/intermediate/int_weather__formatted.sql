--Create NYC Weather View
SELECT station,
       location_name,
       TO_DATE(nested_0."date", 'YYYY-MM-DD', 1) AS "date",
       average_wind,
       precipitation,
       snow,
       snow_depth,
       temp_max,
       temp_min
FROM   (SELECT station,
               name AS location_name,
               CASE WHEN LENGTH(SUBSTR(weather."date", 1, 10)) > 0 THEN SUBSTR(weather."date", 1, 10) ELSE NULL END AS "date",
               CONVERT_TO_FLOAT(weather."awnd", 1, 1, 0) AS average_wind,
               CONVERT_TO_FLOAT(weather."prcp", 1, 1, 0) AS precipitation,
               CONVERT_TO_FLOAT(weather."snow", 1, 1, 0) AS snow,
               CONVERT_TO_FLOAT(weather."snwd", 1, 1, 0) AS snow_depth,
               CONVERT_TO_FLOAT(weather."tempmax", 1, 1, 0) AS temp_max,
               CONVERT_TO_FLOAT(weather."tempmin", 1, 1, 0) AS temp_min
        FROM   nessie.nyc.raw.weather AS weather
       ) nested_0;
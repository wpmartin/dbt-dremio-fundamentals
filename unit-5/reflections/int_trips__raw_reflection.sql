{{ config(materialized='reflection', 
        name='int_trips__raw', 
        reflection_type='raw',
        display=['pickup_time', 'pickup_date', 'passenger_count', 'trip_distance', 'fare_amount', 'tip_amount', 'total_amount']) }}
-- depends_on: {{ ref('int_trips__formatted') }}
{{ config(materialized='reflection',
          name='int_trips__agg',
          reflection_type='aggregate', 
          dimensions=['passenger_count','total_amount','pickup_date','trip_distance'],
          measures=['passenger_count','trip_distance','fare_amount'], 
          computations=['SUM,COUNT','SUM,COUNT','SUM,COUNT'])}}
-- depends_on: {{ ref('int_trips__formatted') }}
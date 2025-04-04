{% docs nyc_taxi_gross_income %}

## Data Documentation for Temperature

This production-level data product, `temperature__view`, details the recorded temperature in [New York City](https://en.wikipedia.org/wiki/New_York_City) on the time-scale of days:

| status           | description                                                                   |
|------------------|-------------------------------------------------------------------------------|
| pickup_date      | The pickup date of the taxi trip (YYYY-MM-DD).                                |
| pickup_time      | The pickup time of the taxi trip (HH24:MI:SS).                                |
| passenger_count  | The number of passengers for the taxi trip.                                   |
| trip_distance    | The total distance travelled during the trip (Miles).                         |
| total_amount     | The total cost of the taxi trip, combined fare and tip ($).                   |

{% enddocs %}

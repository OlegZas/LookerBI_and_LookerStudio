-- Average Elevation by Facility Type
SELECT
    airports.fac_type  AS airports_facility_type,
    AVG(airports.elevation ) AS airports_average_elevation,
    COUNT(*) AS airports_count
FROM `cloud-training-demos.looker_flights.airports`  AS airports
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 5
Number of Flights Cancelled Each Week in 2004
-- raw sql results do not include filled-in values for 'flights.depart_week'


SELECT
    (FORMAT_TIMESTAMP('%F', TIMESTAMP_TRUNC(flights.dep_time , WEEK(MONDAY)))) AS flights_depart_week,
    COUNT(CASE WHEN flights.cancelled  THEN 1 ELSE NULL END) AS flights_cancelled_count
FROM `cloud-training-demos.looker_flights.flights`  AS flights
WHERE ((( flights.dep_time  ) >= ((TIMESTAMP('2004-01-01 00:00:00'))) AND ( flights.dep_time  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP('2004-01-01 00:00:00')), INTERVAL 1 YEAR))))))
GROUP BY
    1
ORDER BY
    1 DESC
LIMIT 500

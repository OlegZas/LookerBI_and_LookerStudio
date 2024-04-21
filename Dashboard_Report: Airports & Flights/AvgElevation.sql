
-- Average Elevation: 
SELECT
    AVG(airports.elevation ) AS airports_average_elevation
FROM `cloud-training-demos.looker_flights.airports`  AS airports
LIMIT 500

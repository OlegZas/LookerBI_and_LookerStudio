-- Number of Flights by Distance Tier in 2003; 
-- raw sql results do not include filled-in values for 'flights.depart_week' and 'flights.distance_tiered'


SELECT * FROM (
SELECT *, DENSE_RANK() OVER (ORDER BY z___min_rank) as z___pivot_row_rank, RANK() OVER (PARTITION BY z__pivot_col_rank ORDER BY z___min_rank) as z__pivot_col_ordering, CASE WHEN z___min_rank = z___rank THEN 1 ELSE 0 END AS z__is_highest_ranked_cell FROM (
SELECT *, MIN(z___rank) OVER (PARTITION BY CAST(flights_depart_week AS STRING)) as z___min_rank FROM (
SELECT *, RANK() OVER (ORDER BY flights_depart_week DESC, z__pivot_col_rank) AS z___rank FROM (
SELECT *, DENSE_RANK() OVER (ORDER BY CASE WHEN flights_distance_tiered__sort_ IS NULL THEN 1 ELSE 0 END, flights_distance_tiered__sort_, CASE WHEN flights_distance_tiered IS NULL THEN 1 ELSE 0 END, flights_distance_tiered) AS z__pivot_col_rank FROM (
SELECT
    CASE
WHEN flights.distance  < 0 THEN 'Below 0'
WHEN flights.distance  >= 0 AND flights.distance  < 100 THEN '0 to 99'
WHEN flights.distance  >= 100 AND flights.distance  < 200 THEN '100 to 199'
WHEN flights.distance  >= 200 AND flights.distance  < 400 THEN '200 to 399'
WHEN flights.distance  >= 400 AND flights.distance  < 600 THEN '400 to 599'
WHEN flights.distance  >= 600 AND flights.distance  < 800 THEN '600 to 799'
WHEN flights.distance  >= 800 AND flights.distance  < 1200 THEN '800 to 1199'
WHEN flights.distance  >= 1200 AND flights.distance  < 1600 THEN '1200 to 1599'
WHEN flights.distance  >= 1600 AND flights.distance  < 3200 THEN '1600 to 3199'
WHEN flights.distance  >= 3200 THEN '3200 or Above'
ELSE 'Undefined'
END AS flights_distance_tiered,
    CASE
WHEN flights.distance  < 0 THEN '00'
WHEN flights.distance  >= 0 AND flights.distance  < 100 THEN '01'
WHEN flights.distance  >= 100 AND flights.distance  < 200 THEN '02'
WHEN flights.distance  >= 200 AND flights.distance  < 400 THEN '03'
WHEN flights.distance  >= 400 AND flights.distance  < 600 THEN '04'
WHEN flights.distance  >= 600 AND flights.distance  < 800 THEN '05'
WHEN flights.distance  >= 800 AND flights.distance  < 1200 THEN '06'
WHEN flights.distance  >= 1200 AND flights.distance  < 1600 THEN '07'
WHEN flights.distance  >= 1600 AND flights.distance  < 3200 THEN '08'
WHEN flights.distance  >= 3200 THEN '09'
ELSE '10'
END AS flights_distance_tiered__sort_,
        (FORMAT_TIMESTAMP('%F', TIMESTAMP_TRUNC(flights.dep_time , WEEK(MONDAY)))) AS flights_depart_week,
    COUNT(*) AS flights_count
FROM `cloud-training-demos.looker_flights.flights`  AS flights
WHERE ((( flights.dep_time  ) >= ((TIMESTAMP('2003-01-01 00:00:00'))) AND ( flights.dep_time  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP('2003-01-01 00:00:00')), INTERVAL 1 YEAR))))))
GROUP BY
    1,
    2,
    3) ww
) bb WHERE z__pivot_col_rank <= 16384
) aa
) xx
) zz
 WHERE (z__pivot_col_rank <= 50 OR z__is_highest_ranked_cell = 1) AND (z___pivot_row_rank <= 500 OR z__pivot_col_ordering = 1) ORDER BY z___pivot_row_rank

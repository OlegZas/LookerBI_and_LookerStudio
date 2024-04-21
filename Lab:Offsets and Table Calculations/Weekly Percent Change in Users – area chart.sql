-- raw sql results do not include filled-in values for 'users.created_week'


SELECT
    (FORMAT_TIMESTAMP('%F', TIMESTAMP_TRUNC(users.created_at , WEEK(MONDAY)))) AS users_created_week,
    COUNT(DISTINCT users.id ) AS users_count
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
LEFT JOIN `cloud-training-demos.looker_ecomm.users`
     AS users ON order_items.user_id = users.id
WHERE ((( users.created_at  ) >= (TIMESTAMP('2020-05-15 00:00:00')) AND ( users.created_at  ) < (TIMESTAMP('2020-09-16 00:00:00')))) AND ((users.first_name ) <> 'Oleg Zas' OR (users.first_name ) IS NULL)
GROUP BY
    1
ORDER BY
    1 DESC
LIMIT 500

-- sql for creating the total and/or determining pivot columns
SELECT
    COUNT(DISTINCT users.id ) AS users_count
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
LEFT JOIN `cloud-training-demos.looker_ecomm.users`
     AS users ON order_items.user_id = users.id
WHERE ((( users.created_at  ) >= (TIMESTAMP('2020-05-15 00:00:00')) AND ( users.created_at  ) < (TIMESTAMP('2020-09-16 00:00:00')))) AND ((users.first_name ) <> 'Oleg Zas' OR (users.first_name ) IS NULL)
LIMIT 1

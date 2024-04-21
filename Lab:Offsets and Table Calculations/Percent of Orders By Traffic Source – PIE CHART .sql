SELECT
    users.traffic_source  AS users_traffic_source,
    COUNT(DISTINCT order_items.order_id ) AS order_items_order_count
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
LEFT JOIN `cloud-training-demos.looker_ecomm.users`
     AS users ON order_items.user_id = users.id
WHERE ((( order_items.created_at  ) >= ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), YEAR)), INTERVAL -1 YEAR)))) AND ( order_items.created_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), YEAR)), INTERVAL -1 YEAR))), INTERVAL 1 YEAR))))))
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 500

-- sql for creating the total and/or determining pivot columns
SELECT
    COUNT(DISTINCT order_items.order_id ) AS order_items_order_count
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
LEFT JOIN `cloud-training-demos.looker_ecomm.users`
     AS users ON order_items.user_id = users.id
WHERE ((( order_items.created_at  ) >= ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), YEAR)), INTERVAL -1 YEAR)))) AND ( order_items.created_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), YEAR)), INTERVAL -1 YEAR))), INTERVAL 1 YEAR))))))
LIMIT 1

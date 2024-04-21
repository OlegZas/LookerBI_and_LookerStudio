-- raw sql results do not include filled-in values for 'order_items.returned_month'


SELECT
    (FORMAT_TIMESTAMP('%Y-%m', order_items.returned_at )) AS order_items_returned_month,
    COUNT(*) AS order_items_order_item_count
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
WHERE ((( order_items.returned_at  ) >= ((TIMESTAMP('2020-01-01 00:00:00'))) AND ( order_items.returned_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP('2020-01-01 00:00:00')), INTERVAL 1 YEAR))))))
GROUP BY
    1
ORDER BY
    1 DESC
LIMIT 500

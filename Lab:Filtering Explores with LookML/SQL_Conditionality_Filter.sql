
SELECT
    order_items.order_id  AS order_items_order_id,
        (EXTRACT(YEAR FROM order_items.created_at )) AS order_items_created_year,
    AVG(order_items.sale_price ) AS order_items_average_sale_price
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
WHERE ((( order_items.created_at  ) >= ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), YEAR)), INTERVAL -2 YEAR)))) AND ( order_items.created_at  ) < ((TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP(DATETIME_ADD(DATETIME(TIMESTAMP_TRUNC(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY), YEAR)), INTERVAL -2 YEAR))), INTERVAL 3 YEAR))))))
GROUP BY

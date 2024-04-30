SELECT * FROM (
SELECT *, DENSE_RANK() OVER (ORDER BY z___min_rank) as z___pivot_row_rank, RANK() OVER (PARTITION BY z__pivot_col_rank ORDER BY z___min_rank) as z__pivot_col_ordering, CASE WHEN z___min_rank = z___rank THEN 1 ELSE 0 END AS z__is_highest_ranked_cell FROM (
SELECT *, MIN(z___rank) OVER (PARTITION BY CAST(users_state AS STRING)) as z___min_rank FROM (
SELECT *, RANK() OVER (ORDER BY CASE WHEN z__pivot_col_rank=1 THEN (CASE WHEN order_items_order_count IS NOT NULL THEN 0 ELSE 1 END) ELSE 2 END, CASE WHEN z__pivot_col_rank=1 THEN order_items_order_count ELSE NULL END DESC, order_items_order_count DESC, z__pivot_col_rank, users_state) AS z___rank FROM (
SELECT *, DENSE_RANK() OVER (ORDER BY CASE WHEN products_department IS NULL THEN 1 ELSE 0 END, products_department) AS z__pivot_col_rank FROM (
SELECT
    products.department  AS products_department,
    users.state  AS users_state,
    COUNT(DISTINCT order_items.order_id ) AS order_items_order_count,
    COUNT(DISTINCT users.id ) AS users_count
FROM `cloud-training-demos.looker_ecomm.order_items`
     AS order_items
LEFT JOIN `cloud-training-demos.looker_ecomm.users`
     AS users ON order_items.user_id = users.id
LEFT JOIN `cloud-training-demos.looker_ecomm.inventory_items`
     AS inventory_items ON order_items.inventory_item_id = inventory_items.id
LEFT JOIN `cloud-training-demos.looker_ecomm.products`
     AS products ON inventory_items.product_id = products.id
WHERE (users.country ) = 'USA'
GROUP BY
    1,
    2) ww
) bb WHERE z__pivot_col_rank <= 16384
) aa
) xx
) zz
 WHERE (z__pivot_col_rank <= 50 OR z__is_highest_ranked_cell = 1) AND (z___pivot_row_rank <= 5000 OR z__pivot_col_ordering = 1) ORDER BY z___pivot_row_rank

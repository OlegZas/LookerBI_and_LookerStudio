# Lab: Table Calculations and Offsets in Looker

![Table Calculations](https://github.com/OlegZas/LookerBI_and_LookerStudio/assets/115661636/136c25f9-1895-411e-8755-5e71a0c8cacf)

**Calculate percentage of orders by traffic source (out of the total number of orders) in the past year**
1. Creating a visualization and filtering based on the traffic source.
2. Creating a '% of Total' calculation to get the relative percentage of the total number of orders for each traffic source.
3. Creating a pie chart to visually show the percentage of orders by traffic source.

![Percentage of Orders by Traffic Source](https://github.com/OlegZas/LookerBI_and_LookerStudio/assets/115661636/ffc74589-7b14-4c0a-8900-793db2a3a834)

**Task 2: Create a map of the percentage of orders by US State in the past year**
1. Counting orders grouped based on State.
2. Created a custom table calculation column which contains the percentage of orders from total.
3. Created a map to represent the data.

![Percentage of Orders by US State](https://github.com/OlegZas/LookerBI_and_LookerStudio/assets/115661636/e14910d2-8a07-4783-86cd-aac8363acd70)

**Task 3: Create a column chart of the percent change in number of items returned month over month in the year 2020**
1. Counting the number of orders and grouping based on "return date" > Month, then filtering to only show results for 2020.
2. Creating a custom table calculation for the count of returns for the previous month with the use of Offset.
    - `offset(${order_items.order_item_count}, 1)`
3. Custom Table Calculation to find the difference in the number of returns month over month.
    - `${order_items.order_item_count}/${items_returned_last_month} – 1`

![Percent Change in Number of Items Returned](https://github.com/OlegZas/LookerBI_and_LookerStudio/assets/115661636/070c7c6d-fc8a-4bf4-ac35-e6f9c4ec8f8e)

**Task 4: Create a column chart of the percent change in number of users created week over week for May 15, 2020 to September 15, 2020**
1. Counting the number of users ‘Create’ for each week then filtering to only count the once in a specific range.
2. Creating a table calculation with offset for users “Created Last Week”
    - `offset(${users.count}, 1)` --- skips the first row this way the first row will contain the results for the second row, etc.
3. Creating a table calculation to get the difference from last week
    - `${users.count}/${users_last_week} – 1`

![Percent Change in Number of Users Created](https://github.com/OlegZas/LookerBI_and_LookerStudio/assets/115661636/431fc181-8783-4a92-8cd6-3b3c22e1d457)

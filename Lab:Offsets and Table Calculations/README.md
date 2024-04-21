Lab: Table Calculations and Offsets in Looker

Calculate percentage of orders by traffic source (out of the total number of orders) in the past year
1.	Creating a visualization and filtering based on the traffic source. 
2.	Creating ‘% of Total’ calculation to get the relative % of total number of orders for each traffic source. 
3.	Creating a pie chart to visually show the % of orders by traffic source. 

Task 2. Create a map of the percentage of orders by US State in the past year
1.Counting orders grouped based on State. 
2. Created a custom table calculation column which contains % of orders from total. 
3. Created a map to represent the data 


Task 3. Create a column chart of the percent change in number of items returned month over month in the year 2020
1.	Counting the number of orders and grouping based on “return date” > Month, then filtering to only show results for 2020. 
2.	Creating a custom table calculation for the count of returns for the previous month with the use of Offset. 
a.	offset(${order_items.order_item_count}, 1)
3.	Custom Table Calculation to find the difference in the number of return month over month. 
a.	${order_items.order_item_count}/${items_returned_last_month} – 1


Task 4. Create a column chart of the percent change in number of users created week over week for May 15, 2020 to September 15, 2020
1.	Counting the number of users ‘Create’ for each week then filtering to only count the once in a specific range. 
2.	Creating a table calculation with offset for users “Created Last Week”
a.	offset(${users.count}, 1) --- skips the first row this way the first row will contain the results for the second row, etc. 
3.	Creating a table calculation to get the difference from last week 
a.	${users.count}/${users_last_week} – 1

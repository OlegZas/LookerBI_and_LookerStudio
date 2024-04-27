<h1>Filtering Explores with LookML </h1>
1.Added an always_filter to the Order Items Explore to require filtering on order status and user country. 

<hr style="border-top: 3px dotted #998143">
2.Added a sql_always_where filter to the Order Items Explore to only include data from the year 2021 and later.

<hr style="border-top: 3px dotted #998143">
3.Added a sql_always_having filter to the Order Items Explore to prevent users from looking at orders with more than one item.

<hr style="border-top: 3px dotted #998143">
4.Added a conditionality_filter filter to the Order Items Explore to only return data for the past 3 years, unless a filter is applied to a user ID or state dimension.


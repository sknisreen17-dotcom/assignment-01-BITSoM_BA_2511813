- Q1.1:
## Anomaly Analysis
Example of an Insert Anomaly- Adding a new sales_rep_name (column M) in row 188 is not possible if they have not made any sale yet since the table is orders-focused.
Example of an Update Anomaly- If the unit_price (column I) of 'Notebook' changes, I must update the unit_price in every row where that product was sold. If Row 2 is updated but Row 12 is forgotten, the same product will show two different prices.
Example of a Delete Anomaly- If i delete the last row 187 because the customer returned the product webcam in product_name (column G-), where row 187 contains the only details of the product 'webcam',  then i will lose all the details associated with it.
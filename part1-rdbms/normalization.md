## Anomaly Analysis
Example of an Insert Anomaly- Adding a new sales_rep_name (column M) in row 188 is not possible if they have not made any sale yet since the table is orders-focused.
Example of an Update Anomaly- If the unit_price (column I) of 'Notebook' changes, I must update the unit_price in every row where that product was sold. If Row 2 is updated but Row 12 is forgotten, the same product will show two different prices.
Example of a Delete Anomaly- If i delete the last row 187 because the customer returned the product webcam in product_name (column G-), where row 187 contains the only details of the product 'webcam',  then i will lose all the details associated with it.

## Normalization Justification
While a single "flat" table may appear simpler initially, it creates significant long-term risks regarding data integrity and storage efficiency. In the provided dataset, keeping everything in one table leads to three major issues: redundancy, update anomalies, and deletion risks.

1. Eliminating Redundancy and Storage Waste
In a flat structure, every time a customer buys a "Laptop," we must manually re-type the product name and the unit price of 55,000. If 1,000 customers buy that laptop, we store that same price 1,000 times. By normalizing into a products table, we store the price once. This reduces storage costs and prevents "Data Entry Fatigue," where a clerk might accidentally type 5,500 instead of 55,000 on one row, making our sales reports inaccurate.

2. Preventing Update Anomalies
Consider Sales Rep Deepak Joshi. In a flat table, his email is repeated on every order he handles. If Deepak changes his email address, we would have to find and update every single historical order row. If we miss even one row, the database becomes inconsistent—a "Update Anomaly." In our 3NF design, we change his email once in the sales_reps table, and it instantly reflects across all his orders.

3. Preventing Deletion Anomalies
If we have a new product like a "Desk Chair" that hasn't been sold yet, a flat table cannot store it because there is no "Order ID" to attach it to. Conversely, if we delete a customer's only order, we might accidentally delete that customer's contact information from our system forever. Normalization ensures that Entities (Customers, Products, Reps) exist independently of Transactions (Orders).

In conclusion, normalization is not over-engineering; it is the foundation of a "Single Source of Truth," ensuring our business data remains reliable as it grows.
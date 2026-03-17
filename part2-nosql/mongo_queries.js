// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    "_id": "1",
    "name": "Wireless Headphones",
    "category": "Electronics",
    "price": 150,
    "features": ["Bluetooth", "Noise Cancelling"],
    "details": { "battery_life": "30 hours", "color": "Black" }
  },
  {
    "_id": "2",
    "name": "Denim Jacket",
    "category": "Clothing",
    "price": 65,
    "sizes": ["Small", "Medium", "Large"],
    "details": { "material": "Cotton", "wash_instruction": "Cold water only" }
  },
  {
    "_id": "3",
    "name": "Peanut Butter",
    "category": "Groceries",
    "price": 5,
    "ingredients": ["Peanuts", "Salt"],
    "expiry_date": ("2026-12-31") 
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ 
  category: "Electronics", 
  price: { $gt: 20000 } 
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ 
  category: "Groceries", 
  expiry_date: { $lt: new Date("2025-01-01") } 
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "1" }, 
  { $set: { discount_percent: 15 } }
);

// OP5: createIndex() — create an index on category field
db.products.createIndex({ category: 1 });

/* EXPLANATION FOR OP5:
Why create an index?  
By creating an index on the "category" field, we give the database a quick-reference guide. Now, when a customer clicks the "Clothing" tab on our website, the database instantly knows exactly where all the clothing documents are stored without having to look at the Electronics or Groceries.
*/
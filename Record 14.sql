#1. Write a MongoDB query to sort customer details in ascending order of their name.

INVOICE> db.customer.find().sort({name:1})
[
  {
    _id: ObjectId('67ff756cb5d57ac5d6e4326a'),
    cust_id: 5,
    name: 'hanan',
    phone: 23244556,
    address: 'mmm house',
    city: 'TVM'
  },
  {
    _id: ObjectId('67fe30acf54e543282e43270'),
    cust_id: 2,
    name: 'nihala',
    phone: 44412345,
    address: 'nnn house',
    city: 'EKM'
  },
  {
    _id: ObjectId('67ff756cb5d57ac5d6e43269'),
    cust_id: 3,
    name: 'sanin',
    phone: 23344556,
    address: 'sss house',
    city: 'EKM'
  }
]

#2.      Write a MongoDB query to count number of customers in each city.

INVOICE> db.customer.aggregate([{ $group:{_id:"$city", cust_count: {$sum:1}}}])

[ 
  { _id: 'EKM', cust_count: 2 },
  { _id: 'TVM', cust_count: 1 } 
]

#3.      Write a MongoDB query to find minimum and maximum age in each city.

INVOICE> db.customer.aggregate([{$group:{_id:"$city",min_age:{$min:"$age"},max_age:{$max:"$age"}}} ]);
[
  { _id: 'TVM', min_age: 28, max_age: 28 },
  { _id: 'EKM', min_age: 25, max_age: 30 }
]

4.    Write a MongoDB query using the $match stage to retrieve all customer documents whose customer_name starts with the letter “S”.

INVOICE> db.customer.aggregate([{$match:{name: /^s/  }}])
[
  {
    _id: ObjectId('67ff756cb5d57ac5d6e43269'),
    cust_id: 3,
    name: 'sanin',
    phone: 23344556,
    address: 'sss house',
    city: 'EKM',
    age: 30
  }
]

5.      Write a query using $lookup to join CUSTOMER and PRODUCT collections and display only customer name, product name, and price.

INVOICE> db.customer.aggregate([
...   { 
...     $lookup: {
...       from: "product",
...       localField: "pid",
...       foreignField: "pid",
...       as: "product_info"
...     }
...   },
...   { 
...     $unwind: "$product_info"
...   },
...   {
...     $project: {
...       _id: 0,
...       name: "$name",
...       pname: "$product_info.name",
...       price: "$product_info.price"
...     }
...   }
... ])
... 
[
  { name: 'nihala', pname: 'Laptop', price: 1200 },
  { name: 'sanin', pname: 'Smartphone', price: 800 },
  { name: 'hanan', pname: 'Smartphone', price: 800 }
]

//VERIFIED

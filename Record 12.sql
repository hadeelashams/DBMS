#1.Write a MongoDB query to create an INVOICE database and collections (CUSTOMER, PRODUCT) and its corresponding documents.


INVOICE> db.customer.insertMany([
...   {
...     cust_id: 1,
...     name: "hadeela",
...     phone: 123456778,
        address: "hhh",
        city: "calicut"
...   },
...   {
...     cust_id: 2,
...     name: "nihala",
...     phone: 44412345,
        city:"nnn house"
...     address: "TVM"
...   }
... ]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('67fe30acf54e543282e4326f'),
    '1': ObjectId('67fe30acf54e543282e43270')
  }
}


INVOICE> db.product.insertMany([
...   {
...     pid: 101,
...     name: "Laptop",
...     description: "15-inch, 16GB RAM",
...     price: 1200,
...     stock: 25
...   },
...   {
...     pid: 102,
...     name: "Smartphone",
...     description: "6.1-inch display, 128GB storage",
...     price: 800,
...     stock: 40
...   }
... ]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('67fe3139f54e543282e43271'),
    '1': ObjectId('67fe3139f54e543282e43272')
  }
}


#2.Write a MongoDB query to find all documents from the collection CUSTOMER

INVOICE> db.customer.find()
[
  {
    _id: ObjectId('67fe30acf54e543282e4326f'),
    cust_id: 1,
    name: 'hadeela',
    phone: 123456778,
    address: 'hhh',
    city: 'calicut'
  },
  {
    _id: ObjectId('67fe30acf54e543282e43270'),
    cust_id: 2,
    name: 'nihala',
    phone: 44412345,
    address: 'nnn house',
    city: 'EKM'
  }
]

#3.      Write a MongoDB query to update the city in the collection CUSTOMER.

INVOICE> db.customer.updateMany({ cust_id:2},{$set:{city:"EKM"}});
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

#4.Write a MongoDB query to delete the first matched document whose city is “Calicut”.

INVOICE> db.customer.deleteOne({city:"calicut"})
{ acknowledged: true, deletedCount: 1 }

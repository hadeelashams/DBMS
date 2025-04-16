#1.      Write a MongoDB query to display the customer documents having city ‘ekm’,’tvm’.

INVOICE> db.customer.find({city:{$in:['EKM','TVM']}})
[
  {
    _id: ObjectId('67fe30acf54e543282e43270'),
    cust_id: 2,
    name: 'nihala',
    phone: 44412345,
    address: 'nnn house',
    city: 'EKM'
  },
  {
    _id: ObjectId('67ff756cb5d57ac5d6e4326a'),
    cust_id: 5,
    name: 'hanan',
    phone: 23244556,
    address: 'mmm house',
    city: 'TVM'
  }
]

# 2. Write a MongoDB query to display all product documents their price >50.
INVOICE> db.product.find({price:{$gt:50}})
[
  {
    _id: ObjectId('67fe3139f54e543282e43271'),
    pid: 101,
    name: 'Laptop',
    description: '15-inch, 16GB RAM',
    price: 1200,
    stock: 25
  },
  {
    _id: ObjectId('67fe3139f54e543282e43272'),
    pid: 102,
    name: 'Smartphone',
    description: '6.1-inch display, 128GB storage',
    price: 800,
    stock: 40
  }
]

# 3.     Write a MongoDB query to find customer documents who not live in ‘tvm’.

INVOICE> db.customer.find({city:{$ne:'TVM'}})
[
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

#1.      Write a MongoDB query to create a user “CUSTOMER1” and grant the read role in the INVOICE database.

INVOICE> db.createUser({ user: "customer1", pwd: "123", roles: [{ role: "read", db: "INVOICE" }] });
{ ok: 1 }

#2.      Write a MongoDB query to create the backup for the INVOICE database.
ksb@ksb-H410M-H-V2:~$ mongodump --db=INVOICE --out=./backup
2025-04-22T15:38:29.049+0530	writing INVOICE.product to backup/INVOICE/product.bson
2025-04-22T15:38:29.050+0530	writing INVOICE.PRODUCT to backup/INVOICE/PRODUCT.bson
2025-04-22T15:38:29.050+0530	writing INVOICE.CUSTOMER to backup/INVOICE/CUSTOMER.bson
2025-04-22T15:38:29.050+0530	done dumping INVOICE.product (2 documents)
2025-04-22T15:38:29.051+0530	done dumping INVOICE.PRODUCT (7 documents)
2025-04-22T15:38:29.053+0530	done dumping INVOICE.CUSTOMER (2 documents)
2025-04-22T15:38:29.055+0530	writing INVOICE.customer to backup/INVOICE/customer.bson
2025-04-22T15:38:29.056+0530	done dumping INVOICE.customer (3 documents)

#3.Write a MongoDB query to restore a particular database or a collection.
ksb@ksb-H410M-H-V2:~$ mongorestore --db INVOICE /home/ksb/backup/INVOICE
2025-04-22T15:40:25.943+0530	The --db and --collection flags are deprecated for this use-case; please use --nsInclude instead, i.e. with --nsInclude=${DATABASE}.${COLLECTION}
2025-04-22T15:40:25.943+0530	building a list of collections to restore from /home/ksb/backup/INVOICE dir
2025-04-22T15:40:25.943+0530	reading metadata for INVOICE.CUSTOMER from /home/ksb/backup/INVOICE/CUSTOMER.metadata.json
2025-04-22T15:40:25.943+0530	reading metadata for INVOICE.PRODUCT from /home/ksb/backup/INVOICE/PRODUCT.metadata.json
2025-04-22T15:40:25.943+0530	reading metadata for INVOICE.customer from /home/ksb/backup/INVOICE/customer.metadata.json
2025-04-22T15:40:25.943+0530	reading metadata for INVOICE.product from /home/ksb/backup/INVOICE/product.metadata.json
2025-04-22T15:40:25.943+0530	restoring to existing collection INVOICE.PRODUCT without dropping
2025-04-22T15:40:25.943+0530	restoring INVOICE.PRODUCT from /home/ksb/backup/INVOICE/PRODUCT.bson
2025-04-22T15:40:25.944+0530	restoring to existing collection INVOICE.customer without dropping
2025-04-22T15:40:25.944+0530	restoring INVOICE.customer from /home/ksb/backup/INVOICE/customer.bson
2025-04-22T15:40:25.944+0530	restoring to existing collection INVOICE.product without dropping
2025-04-22T15:40:25.944+0530	restoring to existing collection INVOICE.CUSTOMER without dropping
2025-04-22T15:40:25.944+0530	restoring INVOICE.CUSTOMER from /home/ksb/backup/INVOICE/CUSTOMER.bson
2025-04-22T15:40:25.944+0530	restoring INVOICE.product from /home/ksb/backup/INVOICE/product.bson
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.CUSTOMER index: _id_ dup key: { _id: ObjectId('67fe30a7f54e543282e4326d') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.CUSTOMER index: _id_ dup key: { _id: ObjectId('67fe30a7f54e543282e4326e') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.product index: _id_ dup key: { _id: ObjectId('67fe3139f54e543282e43271') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.product index: _id_ dup key: { _id: ObjectId('67fe3139f54e543282e43272') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.customer index: _id_ dup key: { _id: ObjectId('67fe30acf54e543282e43270') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.customer index: _id_ dup key: { _id: ObjectId('67ff756cb5d57ac5d6e43269') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.customer index: _id_ dup key: { _id: ObjectId('67ff756cb5d57ac5d6e4326a') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: ObjectId('66138a999d40489abbef6350') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: ObjectId('66138a999d40489abbef6351') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: ObjectId('66138a999d40489abbef6352') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: ObjectId('66138b4225bca80254ef634d') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: ObjectId('66138b4225bca80254ef634e') }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: 101 }
2025-04-22T15:40:25.947+0530	continuing through error: E11000 duplicate key error collection: INVOICE.PRODUCT index: _id_ dup key: { _id: 102 }
2025-04-22T15:40:25.954+0530	finished restoring INVOICE.CUSTOMER (0 documents, 2 failures)
2025-04-22T15:40:25.954+0530	finished restoring INVOICE.product (0 documents, 2 failures)
2025-04-22T15:40:25.954+0530	finished restoring INVOICE.PRODUCT (0 documents, 7 failures)
2025-04-22T15:40:25.954+0530	finished restoring INVOICE.customer (0 documents, 3 failures)
2025-04-22T15:40:25.954+0530	no indexes to restore for collection INVOICE.CUSTOMER
2025-04-22T15:40:25.954+0530	no indexes to restore for collection INVOICE.PRODUCT
2025-04-22T15:40:25.954+0530	no indexes to restore for collection INVOICE.customer
2025-04-22T15:40:25.954+0530	no indexes to restore for collection INVOICE.product
2025-04-22T15:40:25.954+0530	0 document(s) restored successfully. 14 document(s) failed to restore.


#4.      Write a MongoDB query to create an index for the collection customer using the field customer_name.

INVOICE> db.customer.createIndex({name:1})
name_1

INVOICE> db.customer.getIndexes()
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { name: 1 }, name: 'name_1' }
]
//VERIFIED

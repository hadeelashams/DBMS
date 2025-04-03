PL/SQL PROGRAMS- STORED PROCEDURES

1.      Create a procedure to display all tables in the invoice database.
mysql> DELIMITER //
mysql> USE Invoice //
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create procedure Invoice()
    -> begin
    -> select *from customer;
    -> select *from product;
    -> select *from invoice_item;
    -> select *from invoice_master;
    -> end
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call Invoice //
+------+---------+---------+-----------+-----------+
| id   | name    | address | city      | phone_no  |
+------+---------+---------+-----------+-----------+
| 1001 | fza     | wwww    | mlp       | 489632175 |
| 1002 | Hanan   | bbbb    | Kannur    | 452268411 |
| 1003 | Hadeela | alfalh  | calicut   |      NULL |
| 1004 | Hibha   | dddd    | Ernakulam | 976765432 |
+------+---------+---------+-----------+-----------+
4 rows in set (0.01 sec)

+-----+-------------+-------+
| pid | pname       | price |
+-----+-------------+-------+
| 111 | pen         |    10 |
| 112 | pencil      |     8 |
| 113 | soap        |    54 |
| 114 | book        |    61 |
| 115 | watch       |   255 |
| 116 | Record book |   357 |
+-----+-------------+-------+
6 rows in set (0.01 sec)

+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |  111 |        2 |
|    101 |  112 |        3 |
|    102 |  112 |        1 |
|    102 |  115 |        1 |
|    103 |  114 |        4 |
+--------+------+----------+
5 rows in set (0.01 sec)

+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|    101 |    1001 | 2024-11-08 |
|    102 |    1002 | 2023-04-23 |
|    103 |    1003 | 2023-06-12 |
|    104 |    1003 | 2023-06-12 |
|    105 |    1004 | 2024-04-18 |
|    106 |    1003 | 2024-02-21 |
+--------+---------+------------+
6 rows in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

2.      Create a procedure to find greatest of 2 numbers.

mysql> create procedure greater(a int,b int) 
    -> begin
    -> if a > b then select a as "greater";
    -> else select b as 'greater';
    -> end if;
    -> end$
    
Query OK, 0 rows affected (0.01 sec)

mysql> call greater(10,5)$
+---------+
| greater |
+---------+
|      10 |
+---------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

3.Create a procedure to display invoice details of a particular customer.

mysql> create procedure invoice_details(in cust_name varchar(20)) 
       begin 
       select 
       im.inv_id, im.inv_date, 
       p.pname, ii.quantity 
       from     
       invoice_master im  join     
       invoice_item ii on im.inv_id = ii.inv_id join    
       product p on p.pid=ii.pid join    
       customer c on im.cust_id=c.id where   
       c.name=cust_name; 
       end//
Query OK, 0 rows affected (0.00 sec)

mysql> call invoice_details('Hadeela') //
+--------+------------+-------+----------+
| inv_id | inv_date   | pname | quantity |
+--------+------------+-------+----------+
|    103 | 2023-06-12 | book  |        4 |
+--------+------------+-------+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

#1.Create a trigger to handle updates to the customer.


mysql> create trigger c_upd after update on customer for each row begin insert into cust set id=new.id,name=new.name,city=new.city,phno=new.phone_no; end//
Query OK, 0 rows affected (0.01 sec)

mysql> create table cust(id int,name varchar(10),city varchar(10),phno int) //
Query OK, 0 rows affected (0.04 sec)


mysql> select * from customer //
+------+---------+---------+-----------+-----------+
| id   | name    | address | city      | phone_no  |
+------+---------+---------+-----------+-----------+
| 1001 | fza     | wwww    | mlp       | 489632175 |
| 1002 | Hanan   | bbbb    | Kannur    | 452268411 |
| 1003 | Hadeela | alfalh  | calicut   |      NULL |
| 1004 | Hibha   | dddd    | Ernakulam | 976765432 |
+------+---------+---------+-----------+-----------+
4 rows in set (0.01 sec)

mysql> update customer set city='calicut' where id='1003' //
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> select * from cust //
+------+---------+---------+------+
| id   | name    | city    | phno |
+------+---------+---------+------+
| 1003 | Hadeela | calicut | NULL |
+------+---------+---------+------+
1 row in set (0.00 sec)


2.Create a trigger to handle inserts to the product relation ( if price < 5 the set price to 10).

mysql> create trigger p_ins
    -> before insert on product
    -> for each row begin 
    -> if new.price < 5 then
    -> set new.price=10;
    -> end if;
    -> end //

mysql> select * from product //
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
6 rows in set (0.00 sec)

//VERIFIED

1.Create a function to calculate price_range(low, medium, high) of each product. If price<=5 indicate as low, upto 50 indicate as medium, and above as high.

mysql> create function price_range(price int) returns varchar(10) 
     deterministic 
     begin
     declare msg varchar(10); 
     if price <= 5 then 
        set msg ='Low'; 
    elseif price <= 50 then 
        set msg = 'Medium';
    else 
        set msg = 'high';
    end if; return(msg); end//

Query OK, 0 rows affected (0.01 sec)

mysql> select pname,price,price_range(price) from product//
+-------------+-------+--------------------+
| pname       | price | price_range(price) |
+-------------+-------+--------------------+
| pen         |    10 | Medium             |
| pencil      |     8 | Medium             |
| soap        |    54 | high               |
| book        |    61 | high               |
| watch       |   255 | high               |
| Record book |   357 | high               |
+-------------+-------+--------------------+
6 rows in set (0.00 sec)
//VERIFIED

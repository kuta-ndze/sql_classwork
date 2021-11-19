SELECT b.title,p.contact, p.phone
  FROM books b, publisher p
    WHERE b.pubid = p.pubid; 
	
SELECT b.Title,p.contact,p.phone
  FROM publisher p JOIN books b
    USING(pubid);
	
SELECT o.order#,c.firstname ||' '|| c.lastname name
  FROM orders o, customers c
   WHERE o.customer# =c.customer#
    AND o.shipdate IS NULL
      ORDER BY o.orderdate;
	  
SELECT o.order#,c.firstname ||' '|| c.lastname name
  FROM orders o JOIN customers c
   USING(customer#)
     WHERE o.shipdate IS NULL
      ORDER BY o.orderdate;
	  
SELECT DISTINCT c.firstname|| ' ' || c.lastname "CUSTOMER NAME" ,b.title
   FROM customers c, books b, orders o, orderitems oi
     WHERE c.customer#=o.customer#
	   AND o.order#=oi.order#
	   AND oi.isbn =b.isbn
	   AND c.firstname|| ' ' || c.lastname ='JAKE LUCAS';
	   
SELECT DISTINCT c.firstname|| ' ' || c.lastname "CUSTOMER NAME" ,b.title
   FROM customers c JOIN orders o USING(customer#)
     JOIN orderitems oi USING(order#)
	 JOIN books b USING(isbn)
   WHERE c.firstname|| ' ' || c.lastname ='JAKE LUCAS';
   
SELECT o.orderdate,b.title,  (oi.paideach- b.cost) Profit
  FROM  books b, customers c, orders o, orderitems oi
    WHERE c.customer#=o.customer#
      AND o.order#=oi.order#
      AND oi.isbn=b.isbn
      AND c.firstname|| ' '|| c.lastname ='JAKE LUCAS'
      ORDER BY Profit DESC, o.orderdate;
	  
SELECT o.orderdate,b.title,  (oi.paideach- b.cost) Profit
  FROM  customers c NATURAL JOIN orders o
        NATURAL JOIN orderitems oi
        NATURAL JOIN books b
    WHERE c.firstname|| ' '|| c.lastname ='JAKE LUCAS'
    ORDER BY Profit DESC, o.orderdate;
	
SELECT a.lname|| ' '|| a.fname Author ,b.title
  FROM customers c, books b,author a, bookauthor ba, orders o,orderitems oi
    WHERE c.customer#=o.customer#
     AND  o.order#=oi.order#
     AND  oi.isbn=b.isbn
     AND  b.isbn =ba.isbn
     AND  ba.authorid=a.authorid
     AND  c.firstname || ' '|| c.lastname ='BECCA NELSON';

SELECT a.lname|| ' '|| a.fname Author ,b.title
  FROM customers c NATURAL JOIN orders o
    NATURAL JOIN orderitems oi
    NATURAL JOIN books b
    NATURAL JOIN bookauthor ba
    NATURAL JOIN author a
     WHERE  c.firstname || ' '|| c.lastname ='BECCA NELSON';
     
SELECT COUNT(b.category) "COOKING TOTAL"
  FROM books b
    WHERE category ='COOKING';
	
SELECT SUM((b.retail-b.cost)*oi.quantity) "TOTAL PROFIT"
  FROM orders o, orderitems oi, books b
   WHERE o.order#=oi.order#
    AND b.isbn=oi.isbn
    AND o.customer#=1017;
	
SELECT SUM((b.retail-b.cost)*oi.quantity) "TOTAL PROFIT"
  FROM orders o  JOIN orderitems oi USING(order#)
   JOIN books b  USING(isbn)
    WHERE o.customer#=1017;
	
SELECT MIN(b.retail) "COMPUTER_RETAIL PRICE"
  FROM books b
    WHERE category ='COMPUTER';
	
SELECT o.customer#, COUNT(*) "ORDER TOTAL"
  FROM orders o
    GROUP BY o.customer#;
	
SELECT p.name, AVG(b.retail) "AVERAGE RETAIL PRICE"
  FROM books b, publisher p 
    WHERE b.pubid=p.pubid
      AND b.category IN ('CHILDREN' , 'COMPUTER')
       GROUP BY p.name,b.category
        HAVING AVG(b.retail)>50;
	
SELECT p.name, AVG(b.retail) "AVERAGE RETAIL PRICE"
  FROM books b JOIN publisher p  USING(pubid)
    WHERE b.category IN ('CHILDREN' , 'COMPUTER')
     GROUP BY p.name,b.category
      HAVING AVG(b.retail)>50;

SELECT DISTINCT c.firstname|| ' ' || c.lastname "CUSTOMER NAME"
  FROM customers c, orders o, orderitems oi, books b
   WHERE c.customer#=o.customer#
    AND  o.order#=oi.order#
    AND  oi.isbn=b.isbn
    AND  c.state IN ('GA','FL')
      GROUP BY o.order#,c.firstname|| ' ' ||c.lastname
        HAVING SUM(b.retail*oi.quantity)>80; 
	  
SELECT DISTINCT c.firstname|| ' ' || c.lastname "CUSTOMER NAME"
  FROM customers c JOIN orders o USING(customer#) 
    JOIN orderitems oi USING(order#) 
    JOIN books b USING(isbn)
     WHERE c.state IN ('GA','FL')
      GROUP BY order#, c.firstname|| ' ' ||c.lastname
        HAVING SUM(b.retail*oi.quantity)>80;

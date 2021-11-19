SELECT c.custzipcode, AVG(ro.carodreading) "CAR ODOMETER READING"
  FROM customer c JOIN vehicle v USING(custno)
   JOIN repairorder ro USING(VIN)
    WHERE c.custzipcode=61761
      GROUP BY c.custzipcode;
      
SELECT v.vmake "VEHICLE MAKE", COUNT(*) count
 FROM vehicle v 
  GROUP BY v.vmake
    ORDER BY COUNT(*) DESC,v.vmake;
    
SELECT i.branchno "BRANCH #", SUM(p.partcost*i.qtyonhand) "TOTAL INVENTORY VALUES"
  FROM part p JOIN inventory i USING(partno)
    GROUP BY i.branchno;
	
SELECT  COUNT(ro.repairordno) "TOTAL REPAIR ORDERS"
  FROM  repairorder ro,partused pu, part p
     WHERE ro.repairordno=pu.repairordno
       AND pu.partno=p.partno
       AND p.partname= 'Tail light'
       AND ro.repairorddate BETWEEN '01-JAN-2021' AND '31-MAR-2021';
    
SELECT v.vmodel || ' ' || v.vmake vehicle, COUNT(ro.repairordno) "TOTAL REPAIRS"
  FROM repairorder ro JOIN vehicle v USING(VIN)
   GROUP BY v.vmodel|| ' ' || v.vmake
     HAVING COUNT(ro.repairordno) >=1
      ORDER BY COUNT(ro.repairordno) DESC;